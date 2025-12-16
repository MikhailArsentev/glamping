#!/bin/bash

# Скрипт полной пересборки с CSS на сервере
# Использование: bash rebuild-with-styles.sh

set -e

APP_PATH="${APP_PATH:-/home/glamping/www}"

echo "🔨 Полная пересборка приложения с CSS"
echo "======================================"

cd ${APP_PATH}

# 1. Остановить приложение
echo "1. Остановка приложения..."
pm2 stop glamping 2>/dev/null || true

# 2. Создать бэкап
echo "2. Создание бэкапа..."
if [ -d ".output" ]; then
    mv .output .output.backup.$(date +%Y%m%d_%H%M%S)
fi

# 3. Очистить кэш
echo "3. Очистка кэша..."
rm -rf .nuxt node_modules/.vite

# 4. Пересобрать приложение
echo "4. Пересборка приложения..."
NODE_ENV=production npm run build

# 5. Проверить что CSS файлы созданы
echo "5. Проверка CSS файлов..."
if [ -d ".output/public/_nuxt" ]; then
    echo "✓ Директория .output/public/_nuxt существует"
    ls -lh .output/public/_nuxt/ | grep -E "\.(css|js)$"
else
    echo "✗ ОШИБКА: Директория .output/public/_nuxt НЕ найдена!"
    echo "Проверьте логи сборки выше"
    exit 1
fi

# 6. Убедиться что public/primevue.css существует
echo "6. Проверка public/primevue.css..."
if [ ! -f "public/primevue.css" ]; then
    echo "⚠️  Создаём public/primevue.css..."
    mkdir -p public
    cat > public/primevue.css << 'EOF'
/* Minimal PrimeVue styles for custom styling with Tailwind */

/* Dialog */
.p-dialog { background: white; border-radius: 0.5rem; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1); }
.p-dialog-header { padding: 1.5rem; border-bottom: 1px solid #e5e7eb; }
.p-dialog-title { font-weight: 700; font-size: 1.25rem; }
.p-dialog-content { padding: 1.5rem; }

/* Sidebar */
.p-sidebar { background: white; box-shadow: -2px 0 8px rgba(0, 0, 0, 0.1); }
.p-sidebar-header { padding: 1.5rem; }
.p-sidebar-content { padding: 0 1.5rem 1.5rem; }

/* Toast */
.p-toast { opacity: 1; }
.p-toast-message { border-radius: 0.5rem; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); margin: 0.5rem 0; }
.p-toast-message-success { background: #10b981; color: white; }
.p-toast-message-error { background: #ef4444; color: white; }
.p-toast-message-warn { background: #f59e0b; color: white; }
.p-toast-message-content { padding: 1rem; }

/* Input */
.p-inputtext { width: 100%; padding: 0.75rem 1rem; border: 1px solid #d1d5db; border-radius: 0.375rem; font-size: 1rem; transition: all 0.2s; }
.p-inputtext:focus { outline: none; border-color: #B3C5FF; box-shadow: 0 0 0 3px rgba(179, 197, 255, 0.1); }

/* Button */
.p-button { display: inline-flex; align-items: center; justify-content: center; padding: 0.75rem 1.5rem; border-radius: 0.375rem; font-weight: 500; transition: all 0.2s; border: none; cursor: pointer; }
.p-button:focus { outline: none; box-shadow: 0 0 0 3px rgba(179, 197, 255, 0.3); }
.p-button-label { font-weight: 500; }

/* Component Focus States */
.p-component:focus { outline: none; }

/* Overlay */
.p-component-overlay { background-color: rgba(0, 0, 0, 0.4); }
EOF
    echo "✓ Файл public/primevue.css создан"
else
    echo "✓ Файл public/primevue.css уже существует"
fi

# 7. Запустить приложение
echo "7. Запуск приложения..."
pm2 delete glamping 2>/dev/null || true
pm2 start ecosystem.config.cjs --env production
pm2 save

# 8. Подождать 3 секунды
sleep 3

# 9. Проверить что приложение запустилось
echo "8. Проверка запуска..."
if pm2 list | grep -q "glamping.*online"; then
    echo "✅ Приложение успешно запущено"
    
    # Проверить доступность CSS
    echo ""
    echo "9. Проверка доступности CSS..."
    
    if curl -s -o /dev/null -w "%{http_code}" http://localhost:3001/primevue.css | grep -q "200"; then
        echo "✓ primevue.css доступен (200 OK)"
    else
        echo "✗ primevue.css НЕ доступен"
    fi
    
    # Найти и проверить CSS файлы Nuxt
    CSS_FILE=$(ls .output/public/_nuxt/*.css 2>/dev/null | head -n 1)
    if [ -n "$CSS_FILE" ]; then
        CSS_BASENAME=$(basename $CSS_FILE)
        if curl -s -o /dev/null -w "%{http_code}" http://localhost:3001/_nuxt/$CSS_BASENAME | grep -q "200"; then
            echo "✓ Nuxt CSS доступен: /_nuxt/$CSS_BASENAME (200 OK)"
        else
            echo "✗ Nuxt CSS НЕ доступен: /_nuxt/$CSS_BASENAME"
        fi
    else
        echo "⚠️  CSS файлы Nuxt не найдены в .output/public/_nuxt/"
    fi
    
else
    echo "❌ ОШИБКА: Приложение не запустилось!"
    echo ""
    echo "Логи PM2:"
    pm2 logs glamping --lines 50 --nostream
    exit 1
fi

echo ""
echo "======================================"
echo "✅ Пересборка завершена!"
echo ""
echo "Следующие шаги:"
echo "1. Откройте https://glamping.m-arsentev.ru/"
echo "2. Нажмите Ctrl+Shift+R (жесткая перезагрузка)"
echo "3. Проверьте DevTools (F12) → Console на ошибки"
echo "4. Проверьте DevTools → Network → CSS файлы"
echo ""
echo "Логи приложения:"
echo "  pm2 logs glamping"

