#!/bin/bash

# Скрипт для диагностики проблем с деплоем
# Запустить на сервере

set -e

echo "🔍 Диагностика деплоя Glamping сайта"
echo "======================================"

APP_PATH="${APP_PATH:-/home/glamping/www}"
PORT=3001

# Цвета
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "📁 Проверка файловой структуры..."
echo "Директория: ${APP_PATH}"
cd ${APP_PATH}

if [ -d ".output" ]; then
    echo -e "${GREEN}✓${NC} .output директория существует"
    ls -lh .output/
else
    echo -e "${RED}✗${NC} .output директория НЕ найдена!"
    exit 1
fi

echo ""
echo "📦 Проверка ecosystem.config.cjs..."
if [ -f "ecosystem.config.cjs" ]; then
    echo -e "${GREEN}✓${NC} ecosystem.config.cjs найден"
    cat ecosystem.config.cjs | grep -A 5 "port:"
else
    echo -e "${RED}✗${NC} ecosystem.config.cjs НЕ найден!"
    exit 1
fi

echo ""
echo "🔄 Проверка PM2 процессов..."
pm2 list

echo ""
echo "📋 Логи PM2 (последние 30 строк)..."
pm2 logs glamping --lines 30 --nostream || echo "Нет логов или процесс не запущен"

echo ""
echo "🌐 Проверка портов..."
echo "Прослушиваемые порты:"
netstat -tlnp 2>/dev/null | grep LISTEN | grep -E ":(3000|3001|80)" || echo "Порты не найдены"

echo ""
echo "🔌 Проверка доступности приложения..."
if curl -s http://localhost:${PORT} > /dev/null; then
    echo -e "${GREEN}✓${NC} Приложение отвечает на http://localhost:${PORT}"
    echo "Статус код:"
    curl -I http://localhost:${PORT} 2>&1 | head -n 1
else
    echo -e "${RED}✗${NC} Приложение НЕ отвечает на http://localhost:${PORT}"
fi

echo ""
echo "📊 Проверка Nginx..."
if systemctl is-active --quiet nginx; then
    echo -e "${GREEN}✓${NC} Nginx запущен"
    
    echo ""
    echo "Конфигурация Nginx:"
    if [ -f "/etc/nginx/sites-available/glamping" ]; then
        cat /etc/nginx/sites-available/glamping | grep -A 2 "proxy_pass"
    else
        echo -e "${RED}✗${NC} Конфигурация Nginx не найдена!"
    fi
else
    echo -e "${RED}✗${NC} Nginx НЕ запущен!"
fi

echo ""
echo "🔍 Проверка статических файлов..."
if [ -d ".output/public" ]; then
    echo -e "${GREEN}✓${NC} .output/public существует"
    echo "Содержимое:"
    ls -lh .output/public/ | head -n 10
else
    echo -e "${RED}✗${NC} .output/public НЕ найдена!"
fi

echo ""
echo "💾 Использование памяти и CPU..."
pm2 show glamping 2>/dev/null || echo "Процесс glamping не найден в PM2"

echo ""
echo "📝 Рекомендации:"
echo "================"

# Проверить порт в PM2 vs Nginx
PM2_PORT=$(cat ecosystem.config.cjs 2>/dev/null | grep "PORT:" | grep -oE "[0-9]+" | head -n 1)
NGINX_PORT=$(cat /etc/nginx/sites-available/glamping 2>/dev/null | grep "proxy_pass" | grep -oE "[0-9]+" | head -n 1)

if [ "$PM2_PORT" != "$NGINX_PORT" ]; then
    echo -e "${RED}⚠️  НЕСООТВЕТСТВИЕ ПОРТОВ!${NC}"
    echo "   PM2 использует порт: ${PM2_PORT}"
    echo "   Nginx проксирует на: ${NGINX_PORT}"
    echo ""
    echo "   Исправьте это выполнив:"
    echo "   sudo wget https://raw.githubusercontent.com/your-repo/glamping/main/scripts/fix-nginx-port.sh"
    echo "   sudo bash fix-nginx-port.sh"
else
    echo -e "${GREEN}✓${NC} Порты соответствуют: ${PM2_PORT}"
fi

echo ""
echo "Для перезапуска:"
echo "  pm2 restart glamping"
echo ""
echo "Для просмотра логов в реальном времени:"
echo "  pm2 logs glamping"

