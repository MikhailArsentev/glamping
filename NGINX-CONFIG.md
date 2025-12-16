# 🌐 Правильная конфигурация Nginx для Nuxt 3

## Рабочая конфигурация

Эта конфигурация проверена и работает на продакшене.

### Файл: `/etc/nginx/sites-available/glamping`

```nginx
server {
    server_name glamping.m-arsentev.ru;

    listen 443 ssl http2;
    ssl_certificate /etc/letsencrypt/live/glamping.m-arsentev.ru/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/glamping.m-arsentev.ru/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    # Весь трафик проксируется на Nuxt приложение
    # Nuxt сам обрабатывает статические файлы
    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}

server {
    if ($host = glamping.m-arsentev.ru) {
        return 301 https://$host$request_uri;
    }
    listen 80;
    server_name glamping.m-arsentev.ru;
    return 404;
}
```

## Важные моменты

### ✅ Что делать:
- Проксировать весь трафик на Nuxt приложение
- Использовать порт, указанный в `ecosystem.config.cjs` (3001)
- Настроить SSL через Let's Encrypt

### ❌ Чего НЕ делать:
- **Не использовать** `root` или `alias` для `/_nuxt/` директории
- **Не пытаться** отдавать статику напрямую через Nginx
- **Не настраивать** отдельные location блоки для `.css`, `.js` файлов

### Почему?

Nuxt 3 в production режиме (`npm run build`) генерирует оптимизированный сервер в `.output/server/`, который:
- Сам отдаёт статические файлы из `.output/public/`
- Использует правильные заголовки кэширования
- Обрабатывает пути с хэшами в именах файлов
- Поддерживает SSR (Server-Side Rendering)

Попытка обслуживать статику напрямую через Nginx может привести к:
- 404 ошибкам для CSS/JS файлов
- Неправильным путям
- Проблемам с кэшированием

## Установка SSL сертификата

```bash
# Установить certbot
sudo apt install certbot python3-certbot-nginx

# Получить сертификат (автоматически обновит Nginx конфиг)
sudo certbot --nginx -d glamping.m-arsentev.ru

# Автообновление сертификата настроится автоматически
sudo certbot renew --dry-run
```

## Проверка конфигурации

```bash
# Проверить синтаксис
sudo nginx -t

# Перезапустить Nginx
sudo systemctl reload nginx

# Проверить статус
sudo systemctl status nginx

# Проверить логи
sudo tail -f /var/log/nginx/error.log
sudo tail -f /var/log/nginx/access.log
```

## Тестирование

```bash
# Проверить что сайт отвечает
curl -I https://glamping.m-arsentev.ru/

# Проверить CSS файлы
curl -I https://glamping.m-arsentev.ru/_nuxt/entry.*.css

# Проверить редирект с HTTP на HTTPS
curl -I http://glamping.m-arsentev.ru/
```

## Оптимизация (опционально)

Если хотите добавить кэширование на уровне Nginx:

```nginx
# Добавить в server блок
location ~* \.(jpg|jpeg|png|gif|ico|svg|webp|avif)$ {
    proxy_pass http://localhost:3001;
    proxy_cache_valid 200 30d;
    add_header Cache-Control "public, max-age=2592000";
}
```

Но это **не обязательно** - Nuxt уже правильно кэширует статику.

## Troubleshooting

### Проблема: 502 Bad Gateway

**Причина:** Приложение не запущено

**Решение:**
```bash
cd /home/glamping/www
pm2 list
pm2 restart glamping
```

### Проблема: Нет стилей (белая страница)

**Причина:** Неправильная конфигурация Nginx (пытается отдавать `/_nuxt/` напрямую)

**Решение:** Используйте простую конфигурацию выше, без отдельных блоков для `/_nuxt/`

### Проблема: SSL сертификат истёк

**Причина:** Не обновился автоматически

**Решение:**
```bash
sudo certbot renew
sudo systemctl reload nginx
```

## GitHub Secrets для деплоя

Для корректной работы GitHub Actions убедитесь что добавлены secrets:

- `SERVER_HOST` = IP адрес или домен
- `SERVER_USER` = имя пользователя (glamping)
- `SERVER_USER_PASSWORD` = пароль или SSH ключ
- `SERVER_PORT` = 22
- `APP_PATH` = /home/glamping/www

