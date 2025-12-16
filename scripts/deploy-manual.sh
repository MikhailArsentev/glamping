#!/bin/bash

# Скрипт для ручного деплоя (если нужно)
# Использование: ./scripts/deploy-manual.sh

set -e

echo "🚀 Ручной деплой Glamping сайта"

# Цвета
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Конфигурация (измените под свой сервер)
SERVER_USER="${SERVER_USER:-root}"
SERVER_HOST="${SERVER_HOST:-your-server-ip}"
APP_PATH="${APP_PATH:-/var/www/glamping}"

if [ "$SERVER_HOST" = "your-server-ip" ]; then
    echo -e "${RED}❌ Ошибка: Настройте переменные окружения!${NC}"
    echo "Экспортируйте переменные:"
    echo "  export SERVER_USER=your-username"
    echo "  export SERVER_HOST=your-server-ip"
    echo "  export APP_PATH=/var/www/glamping"
    exit 1
fi

echo -e "${YELLOW}Шаг 1: Сборка приложения${NC}"
npm run build

echo -e "${YELLOW}Шаг 2: Создание архива${NC}"
tar -czf deploy.tar.gz \
    .output \
    public \
    package.json \
    package-lock.json \
    nuxt.config.ts \
    ecosystem.config.cjs

echo -e "${YELLOW}Шаг 3: Загрузка на сервер${NC}"
scp deploy.tar.gz ${SERVER_USER}@${SERVER_HOST}:/tmp/

echo -e "${YELLOW}Шаг 4: Распаковка и перезапуск${NC}"
ssh ${SERVER_USER}@${SERVER_HOST} << ENDSSH
cd ${APP_PATH}

# Бэкап текущей версии
if [ -d ".output" ]; then
    mv .output .output.backup.\$(date +%Y%m%d_%H%M%S)
fi

# Распаковка
tar -xzf /tmp/deploy.tar.gz
rm /tmp/deploy.tar.gz

# Установка зависимостей
npm ci --omit=dev

# Перезапуск
pm2 reload ecosystem.config.cjs --env production || pm2 start ecosystem.config.cjs --env production

# Очистка старых бэкапов
ls -dt .output.backup.* 2>/dev/null | tail -n +4 | xargs rm -rf 2>/dev/null || true

echo "✅ Приложение перезапущено"
pm2 list
ENDSSH

echo -e "${YELLOW}Шаг 5: Очистка локального архива${NC}"
rm deploy.tar.gz

echo -e "${GREEN}✅ Деплой завершен успешно!${NC}"
echo ""
echo "Проверьте приложение:"
echo "  http://${SERVER_HOST}"
echo ""
echo "Логи на сервере:"
echo "  ssh ${SERVER_USER}@${SERVER_HOST} 'pm2 logs glamping'"

