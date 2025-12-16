#!/bin/bash

# Скрипт диагностики CSS проблем
# Использование: bash diagnose-css.sh

APP_PATH="${APP_PATH:-/home/glamping/www}"

echo "🔍 Диагностика CSS проблем"
echo "=========================="
echo ""

cd ${APP_PATH}

# Проверка 1: Структура файлов
echo "📁 Проверка 1: Структура файлов"
echo "-------------------------------"
echo "Содержимое .output/public/:"
ls -lR .output/public/ 2>/dev/null || echo "❌ Директория не найдена"
echo ""

# Проверка 2: CSS файлы в _nuxt
echo "📦 Проверка 2: CSS файлы Nuxt"
echo "-----------------------------"
if [ -d ".output/public/_nuxt" ]; then
    CSS_FILES=$(find .output/public/_nuxt -name "*.css" 2>/dev/null)
    if [ -n "$CSS_FILES" ]; then
        echo "✅ Найдены CSS файлы:"
        echo "$CSS_FILES"
        echo ""
        echo "Размеры файлов:"
        ls -lh .output/public/_nuxt/*.css 2>/dev/null
        echo ""
        echo "Содержимое первого CSS файла (первые 20 строк):"
        head -n 20 $(echo "$CSS_FILES" | head -n 1)
    else
        echo "❌ CSS файлы НЕ найдены!"
        echo "Это основная проблема - Nuxt не генерирует CSS"
    fi
else
    echo "❌ Директория .output/public/_nuxt не существует!"
fi
echo ""

# Проверка 3: primevue.css
echo "🎨 Проверка 3: primevue.css"
echo "---------------------------"
if [ -f "public/primevue.css" ]; then
    echo "✅ Файл существует"
    ls -lh public/primevue.css
    echo "Первые 5 строк:"
    head -n 5 public/primevue.css
else
    echo "❌ Файл НЕ существует"
fi
echo ""

# Проверка 4: Доступность через HTTP
echo "🌐 Проверка 4: Доступность CSS через HTTP"
echo "-----------------------------------------"

# primevue.css
PRIME_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3001/primevue.css)
echo "primevue.css: $PRIME_STATUS"
if [ "$PRIME_STATUS" = "200" ]; then
    echo "✅ Доступен"
else
    echo "❌ НЕ доступен (должен быть 200)"
fi

# Nuxt CSS
if [ -d ".output/public/_nuxt" ]; then
    CSS_FILE=$(ls .output/public/_nuxt/*.css 2>/dev/null | head -n 1)
    if [ -n "$CSS_FILE" ]; then
        CSS_NAME=$(basename "$CSS_FILE")
        NUXT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:3001/_nuxt/$CSS_NAME")
        echo "/_nuxt/$CSS_NAME: $NUXT_STATUS"
        if [ "$NUXT_STATUS" = "200" ]; then
            echo "✅ Доступен"
        else
            echo "❌ НЕ доступен"
        fi
    fi
fi
echo ""

# Проверка 5: HTML содержит ссылки на CSS?
echo "📄 Проверка 5: HTML содержит ссылки на CSS"
echo "------------------------------------------"
HTML=$(curl -s http://localhost:3001/)
if echo "$HTML" | grep -q '<link.*\.css'; then
    echo "✅ HTML содержит <link> теги для CSS:"
    echo "$HTML" | grep -o '<link[^>]*\.css[^>]*>' | head -n 5
else
    echo "❌ HTML НЕ содержит ссылок на CSS файлы!"
    echo "Это критичная проблема"
fi
echo ""

# Проверка 6: PM2 логи
echo "📋 Проверка 6: PM2 Логи (последние 20 строк)"
echo "--------------------------------------------"
pm2 logs glamping --lines 20 --nostream 2>/dev/null || echo "❌ Не могу получить логи"
echo ""

# Проверка 7: package.json содержит tailwindcss?
echo "📦 Проверка 7: Зависимости"
echo "--------------------------"
if grep -q "@nuxtjs/tailwindcss" package.json; then
    echo "✅ @nuxtjs/tailwindcss найден в package.json"
else
    echo "❌ @nuxtjs/tailwindcss НЕ найден!"
fi

if [ -f "node_modules/@nuxtjs/tailwindcss/package.json" ]; then
    TAILWIND_VERSION=$(cat node_modules/@nuxtjs/tailwindcss/package.json | grep '"version"' | head -n 1)
    echo "✅ Модуль установлен: $TAILWIND_VERSION"
else
    echo "❌ Модуль @nuxtjs/tailwindcss НЕ установлен!"
fi
echo ""

# Проверка 8: nuxt.config.ts
echo "⚙️  Проверка 8: nuxt.config.ts"
echo "-----------------------------"
if grep -q "@nuxtjs/tailwindcss" nuxt.config.ts; then
    echo "✅ Tailwind подключен в конфиге"
else
    echo "❌ Tailwind НЕ подключен в nuxt.config.ts!"
fi
echo ""

# Проверка 9: Права доступа
echo "🔒 Проверка 9: Права доступа"
echo "----------------------------"
echo "Владелец директории:"
ls -ld .output/ 2>/dev/null || echo "❌ .output не найдена"
echo ""

# Итоговый отчёт
echo "================================"
echo "📊 ИТОГОВЫЙ ОТЧЁТ"
echo "================================"
echo ""

ISSUES=0

if [ ! -d ".output/public/_nuxt" ] || [ -z "$(find .output/public/_nuxt -name '*.css' 2>/dev/null)" ]; then
    echo "❌ КРИТИЧНО: CSS файлы не генерируются Nuxt"
    echo "   Решение: Пересобрать приложение"
    ISSUES=$((ISSUES+1))
fi

if [ ! -f "public/primevue.css" ]; then
    echo "❌ Отсутствует public/primevue.css"
    echo "   Решение: Создать файл"
    ISSUES=$((ISSUES+1))
fi

if ! echo "$HTML" | grep -q '<link.*\.css'; then
    echo "❌ HTML не содержит ссылок на CSS"
    echo "   Решение: Проверить сборку"
    ISSUES=$((ISSUES+1))
fi

if [ $ISSUES -eq 0 ]; then
    echo "✅ Явных проблем не обнаружено"
    echo ""
    echo "Возможные причины если стили всё равно не работают:"
    echo "1. Кэш браузера - нажмите Ctrl+Shift+R"
    echo "2. CDN/прокси кэширование"
    echo "3. Проблемы с Nginx конфигурацией"
else
    echo ""
    echo "Найдено проблем: $ISSUES"
    echo ""
    echo "Рекомендуемые действия:"
    echo "1. Запустите: bash scripts/rebuild-with-styles.sh"
    echo "2. Проверьте логи: pm2 logs glamping"
    echo "3. Проверьте Nginx: sudo nginx -t"
fi

