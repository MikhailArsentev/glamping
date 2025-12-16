#!/bin/bash

# Скрипт для исправления порта в Nginx конфигурации
# Запустить на сервере

set -e

echo "🔧 Исправление порта в Nginx конфигурации"

APP_NAME="glamping"
PORT=3001

# Проверка прав
if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  Этот скрипт требует sudo прав"
    echo "Запустите: sudo bash fix-nginx-port.sh"
    exit 1
fi

echo "Обновление конфигурации Nginx на порт ${PORT}..."

# Создать/обновить конфигурацию
cat > /etc/nginx/sites-available/${APP_NAME} <<EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:${PORT};
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_cache_bypass \$http_upgrade;
    }

    # Статические файлы Nuxt
    location /_nuxt/ {
        proxy_pass http://localhost:${PORT}/_nuxt/;
        proxy_http_version 1.1;
        proxy_cache_valid 200 60m;
        proxy_cache_bypass \$http_pragma \$http_authorization;
        add_header Cache-Control "public, max-age=31536000, immutable";
    }

    # Безопасность
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;

    # Ограничение размера загружаемых файлов
    client_max_body_size 10M;

    # Отключить логирование для статики (опционально)
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot)$ {
        proxy_pass http://localhost:${PORT};
        expires 1y;
        add_header Cache-Control "public, immutable";
        access_log off;
    }
}
EOF

# Активировать конфигурацию
ln -sf /etc/nginx/sites-available/${APP_NAME} /etc/nginx/sites-enabled/

# Удалить конфигурацию по умолчанию
rm -f /etc/nginx/sites-enabled/default

# Проверить конфигурацию
echo "Проверка конфигурации Nginx..."
nginx -t

# Перезапустить Nginx
echo "Перезапуск Nginx..."
systemctl restart nginx

echo "✅ Nginx успешно настроен на порт ${PORT}"
echo ""
echo "Проверьте статус:"
echo "  systemctl status nginx"
echo "  curl -I http://localhost"

