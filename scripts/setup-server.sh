#!/bin/bash

# Скрипт для первоначальной настройки продакшн сервера
# Запустить на сервере от имени пользователя с sudo правами

set -e

echo "🚀 Настройка сервера для деплоя Glamping сайта"

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Конфигурация
APP_NAME="glamping"
APP_PATH="/var/www/${APP_NAME}"
APP_USER="${USER}"
NODE_VERSION="20"

echo -e "${YELLOW}Шаг 1: Обновление системы${NC}"
sudo apt update && sudo apt upgrade -y

echo -e "${YELLOW}Шаг 2: Установка необходимых пакетов${NC}"
sudo apt install -y curl git build-essential nginx

echo -e "${YELLOW}Шаг 3: Установка Node.js ${NODE_VERSION}${NC}"
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "Node.js уже установлен: $(node -v)"
fi

echo -e "${YELLOW}Шаг 4: Установка PM2${NC}"
if ! command -v pm2 &> /dev/null; then
    sudo npm install -g pm2
    pm2 startup systemd -u ${APP_USER} --hp /home/${APP_USER}
else
    echo "PM2 уже установлен: $(pm2 -v)"
fi

echo -e "${YELLOW}Шаг 5: Создание директории приложения${NC}"
sudo mkdir -p ${APP_PATH}
sudo mkdir -p ${APP_PATH}/logs
sudo chown -R ${APP_USER}:${APP_USER} ${APP_PATH}

echo -e "${YELLOW}Шаг 6: Настройка Nginx${NC}"
sudo tee /etc/nginx/sites-available/${APP_NAME} > /dev/null <<EOF
server {
    listen 80;
    server_name your-domain.com www.your-domain.com;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_cache_bypass \$http_upgrade;
    }

    # Статические файлы
    location /_nuxt/ {
        proxy_pass http://localhost:3001/_nuxt/;
        proxy_cache_valid 200 60m;
        proxy_cache_bypass \$http_pragma \$http_authorization;
        add_header Cache-Control "public, immutable";
    }

    # Безопасность
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;

    # Ограничение размера загружаемых файлов
    client_max_body_size 10M;
}
EOF

sudo ln -sf /etc/nginx/sites-available/${APP_NAME} /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

echo -e "${YELLOW}Шаг 7: Настройка firewall${NC}"
if command -v ufw &> /dev/null; then
    sudo ufw allow 22/tcp
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
    sudo ufw --force enable
fi

echo -e "${GREEN}✅ Сервер настроен!${NC}"
echo ""
echo "📋 Следующие шаги:"
echo "1. Добавьте SSH ключ в GitHub Secrets (SSH_PRIVATE_KEY)"
echo "2. Добавьте переменные в GitHub Secrets:"
echo "   - SERVER_HOST: IP адрес вашего сервера"
echo "   - SERVER_USER: ${APP_USER}"
echo "   - SERVER_PORT: 22"
echo "   - APP_PATH: ${APP_PATH}"
echo "3. Настройте DNS для вашего домена"
echo "4. Установите SSL сертификат (certbot):"
echo "   sudo apt install certbot python3-certbot-nginx"
echo "   sudo certbot --nginx -d your-domain.com -d www.your-domain.com"
echo "5. Сделайте первый деплой через GitHub Actions"
echo ""
echo "Nginx конфигурация: /etc/nginx/sites-available/${APP_NAME}"
echo "Директория приложения: ${APP_PATH}"

