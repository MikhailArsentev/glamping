# 🎨 Быстрое исправление стилей

## Проблема
Сайт работает, но нет стилей CSS (всё белое, без оформления).

## Причина
Папка `public/` с файлом `primevue.css` не была включена в архив деплоя.

---

## 🔥 СРОЧНОЕ ИСПРАВЛЕНИЕ (на сервере прямо сейчас)

Подключитесь к серверу и выполните:

```bash
# 1. Перейти в директорию приложения
cd /home/glamping/www

# 2. Создать директорию public если не существует
mkdir -p public

# 3. Создать файл primevue.css
cat > public/primevue.css << 'EOF'
/* Minimal PrimeVue styles for custom styling with Tailwind */

/* Dialog */
.p-dialog {
  background: white;
  border-radius: 0.5rem;
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
}

.p-dialog-header {
  padding: 1.5rem;
  border-bottom: 1px solid #e5e7eb;
}

.p-dialog-title {
  font-weight: 700;
  font-size: 1.25rem;
}

.p-dialog-content {
  padding: 1.5rem;
}

/* Sidebar */
.p-sidebar {
  background: white;
  box-shadow: -2px 0 8px rgba(0, 0, 0, 0.1);
}

.p-sidebar-header {
  padding: 1.5rem;
}

.p-sidebar-content {
  padding: 0 1.5rem 1.5rem;
}

/* Toast */
.p-toast {
  opacity: 1;
}

.p-toast-message {
  border-radius: 0.5rem;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  margin: 0.5rem 0;
}

.p-toast-message-success {
  background: #10b981;
  color: white;
}

.p-toast-message-error {
  background: #ef4444;
  color: white;
}

.p-toast-message-warn {
  background: #f59e0b;
  color: white;
}

.p-toast-message-content {
  padding: 1rem;
}

/* Calendar */
.p-calendar {
  display: inline-block;
}

.p-inputtext {
  width: 100%;
  padding: 0.75rem 1rem;
  border: 1px solid #d1d5db;
  border-radius: 0.375rem;
  font-size: 1rem;
  transition: all 0.2s;
}

.p-inputtext:focus {
  outline: none;
  border-color: #B3C5FF;
  box-shadow: 0 0 0 3px rgba(179, 197, 255, 0.1);
}

.p-datepicker {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 0.5rem;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
  padding: 0.5rem;
}

.p-datepicker table {
  width: 100%;
}

.p-datepicker td {
  padding: 0.5rem;
}

/* InputNumber */
.p-inputnumber-input {
  width: 100%;
}

/* Button */
.p-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem 1.5rem;
  border-radius: 0.375rem;
  font-weight: 500;
  transition: all 0.2s;
  border: none;
  cursor: pointer;
}

.p-button:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(179, 197, 255, 0.3);
}

.p-button-label {
  font-weight: 500;
}

/* Component Focus States */
.p-component:focus {
  outline: none;
}

/* Overlay */
.p-component-overlay {
  background-color: rgba(0, 0, 0, 0.4);
}
EOF

# 4. Проверить что файл создан
ls -la public/primevue.css

# 5. Перезапустить PM2 (необязательно, но на всякий случай)
pm2 restart glamping

# 6. Проверить в браузере
echo "✅ Файл primevue.css создан!"
echo "Откройте https://glamping.m-arsentev.ru/ и нажмите Ctrl+Shift+R"
```

---

## ✅ Проверка результата

После выполнения команд выше:

1. Откройте https://glamping.m-arsentev.ru/
2. Нажмите **Ctrl+Shift+R** (жесткая перезагрузка)
3. Стили должны примениться!

---

## 🚀 Постоянное исправление (для будущих деплоев)

Я уже обновил скрипты деплоя - теперь папка `public/` будет автоматически включаться в архив.

Закоммитьте изменения:

```bash
git add .
git commit -m "fix: include public folder in deployment archive for CSS files"
git push origin main
```

После следующего деплоя через GitHub Actions всё будет работать автоматически!

---

## 📊 Проверка что файлы на месте

На сервере:

```bash
cd /home/glamping/www

# Проверить структуру
tree -L 2 public/

# Или
ls -la public/

# Должны быть файлы:
# - public/primevue.css
# - public/favicon.ico
# - public/robots.txt
```

---

## 🔍 Дополнительная диагностика

Если стили всё равно не применяются:

```bash
# 1. Проверить что файл доступен
curl http://localhost:3001/primevue.css

# 2. Проверить через Nginx
curl http://localhost/primevue.css

# 3. Проверить логи Nginx
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log

# 4. Проверить что .output правильно собран
ls -la .output/public/

# Если там есть _nuxt директория - значит Nuxt правильно собрал статику
```

---

## 💡 Почему это произошло?

В архив деплоя включались только:
- `.output/` (собранное приложение)
- `package.json` и `package-lock.json`
- `nuxt.config.ts`
- `ecosystem.config.cjs`

Но **НЕ включалась** папка `public/` с кастомными статическими файлами!

Теперь исправлено - `public/` включена в архив. ✅

