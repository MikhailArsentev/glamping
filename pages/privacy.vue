<template>
  <div class="min-h-screen pt-20">
    <!-- Hero Section -->
    <section class="bg-accent-light py-20">
      <div class="site-container">
        <div class="max-w-4xl mx-auto text-center">
          <h1 
            class="text-4xl md:text-5xl font-bold text-primary mb-6"
            v-motion
            :initial="{ opacity: 0, y: 30 }"
            :visible="{ opacity: 1, y: 0 }"
          >
            ПОЛИТИКА КОНФИДЕНЦИАЛЬНОСТИ
          </h1>
        </div>
      </div>
    </section>

    <!-- Content Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="max-w-4xl mx-auto prose prose-lg">
          <h2 class="text-2xl font-bold text-primary mb-4">1. Общие положения</h2>
          <p class="text-gray-600 mb-6">
            Настоящая Политика конфиденциальности определяет порядок обработки и защиты персональных данных пользователей сайта глэмпинга "Тропос".
          </p>

          <h2 class="text-2xl font-bold text-primary mb-4">2. Сбор персональных данных</h2>
          <p class="text-gray-600 mb-6">
            Мы собираем только ту информацию, которую вы предоставляете добровольно при заполнении форм бронирования или обратной связи: имя, телефон, email, даты проживания.
          </p>

          <h2 class="text-2xl font-bold text-primary mb-4">3. Использование информации</h2>
          <p class="text-gray-600 mb-6">
            Ваши персональные данные используются исключительно для обработки заявок на бронирование и связи с вами по вопросам вашего пребывания в глэмпинге.
          </p>

          <h2 class="text-2xl font-bold text-primary mb-4">4. Защита данных</h2>
          <p class="text-gray-600 mb-6">
            Мы применяем современные технологии для защиты ваших персональных данных от несанкционированного доступа, изменения или уничтожения.
          </p>

          <h2 class="text-2xl font-bold text-primary mb-4">5. Передача данных третьим лицам</h2>
          <p class="text-gray-600 mb-6">
            Мы не передаем ваши персональные данные третьим лицам без вашего согласия, за исключением случаев, предусмотренных законодательством.
          </p>

          <h2 class="text-2xl font-bold text-primary mb-4">6. Контактная информация</h2>
          <p class="text-gray-600 mb-6">
            По всем вопросам, касающимся обработки персональных данных, вы можете связаться с нами по email: email@mail.ru или телефону: +7 777 777 77 77.
          </p>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
</script>

