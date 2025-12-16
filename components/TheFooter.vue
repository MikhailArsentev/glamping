<template>
  <footer class="bg-white border-t border-gray-200 mt-20">
    <div class="container mx-auto px-4 lg:px-8 py-12">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-8">
        <!-- Contact Info -->
        <div>
          <div class="flex items-center space-x-2 mb-6">
            <div class="w-10 h-10 bg-primary rounded-full flex items-center justify-center">
              <span class="text-white font-bold text-lg">Т</span>
            </div>
            <span class="text-xl font-bold text-primary">ТРОПОС</span>
          </div>
          
          <div class="space-y-3 text-gray-600">
            <div class="flex items-start space-x-3">
              <i class="pi pi-map-marker text-accent mt-1"></i>
              <p class="text-sm">Vana-kaarma 1, k. 3</p>
            </div>
            <div class="flex items-center space-x-3">
              <i class="pi pi-phone text-accent"></i>
              <a href="tel:+77777777777" class="text-sm hover:text-accent transition-colors">+7 777 777 77 77</a>
            </div>
            <div class="flex items-center space-x-3">
              <i class="pi pi-envelope text-accent"></i>
              <a href="mailto:email@mail.ru" class="text-sm hover:text-accent transition-colors">email@mail.ru</a>
            </div>
          </div>
        </div>

        <!-- Map -->
        <div class="h-64 bg-background rounded-lg overflow-hidden">
          <div class="w-full h-full flex items-center justify-center text-gray-400">
            <div class="text-center">
              <i class="pi pi-map text-4xl mb-2"></i>
              <p class="text-sm">Карта загружается...</p>
            </div>
          </div>
        </div>

        <!-- Yandex Widget -->
        <div class="bg-background rounded-lg p-6">
          <h3 class="font-bold text-lg mb-4 text-primary">Я здесь • Яндекс</h3>
          <p class="text-sm text-gray-600">
            Виджет Яндекс для отметки местоположения
          </p>
        </div>
      </div>

      <!-- Bottom Bar -->
      <div class="border-t border-gray-200 pt-6 flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
        <p class="text-sm text-gray-500">© 2025. ВСЕ ПРАВА ЗАЩИЩЕНЫ.</p>
        
        <div class="flex items-center space-x-6 text-sm">
          <NuxtLink to="/privacy" class="text-gray-500 hover:text-accent transition-colors">
            ПОЛИТИКА КОНФИДЕНЦИАЛЬНОСТИ
          </NuxtLink>
          <NuxtLink to="/contacts" class="text-gray-500 hover:text-accent transition-colors">
            УСЛОВИЯ ОБСЛУЖИВАНИЯ
          </NuxtLink>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
</script>

