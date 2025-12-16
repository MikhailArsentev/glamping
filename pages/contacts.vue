<template>
  <div class="min-h-screen pt-20">
    <!-- Hero Section -->
    <section class="bg-accent-light py-20">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="max-w-4xl mx-auto text-center">
          <h1 
            class="text-4xl md:text-5xl font-bold text-primary mb-6"
            v-motion
            :initial="{ opacity: 0, y: 30 }"
            :visible="{ opacity: 1, y: 0 }"
          >
            КОНТАКТЫ
          </h1>
          <p class="text-lg text-gray-700">
            Свяжитесь с нами удобным для вас способом
          </p>
        </div>
      </div>
    </section>

    <!-- Contact Info Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-5xl mx-auto mb-16">
          <!-- Contact Details -->
          <div 
            class="space-y-8"
            v-motion
            :initial="{ opacity: 0, x: -50 }"
            :visible="{ opacity: 1, x: 0 }"
          >
            <div>
              <h3 class="text-2xl font-bold text-primary mb-4">Как с нами связаться</h3>
              <div class="space-y-4">
                <div class="flex items-start space-x-4">
                  <div class="w-12 h-12 bg-accent rounded-full flex items-center justify-center flex-shrink-0">
                    <i class="pi pi-map-marker text-primary text-xl"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-primary mb-1">Адрес</h4>
                    <p class="text-gray-600">Vana-kaarma 1, k. 3</p>
                  </div>
                </div>

                <div class="flex items-start space-x-4">
                  <div class="w-12 h-12 bg-accent rounded-full flex items-center justify-center flex-shrink-0">
                    <i class="pi pi-phone text-primary text-xl"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-primary mb-1">Телефон</h4>
                    <a href="tel:+77777777777" class="text-gray-600 hover:text-accent transition-colors">
                      +7 777 777 77 77
                    </a>
                  </div>
                </div>

                <div class="flex items-start space-x-4">
                  <div class="w-12 h-12 bg-accent rounded-full flex items-center justify-center flex-shrink-0">
                    <i class="pi pi-envelope text-primary text-xl"></i>
                  </div>
                  <div>
                    <h4 class="font-bold text-primary mb-1">Email</h4>
                    <a href="mailto:email@mail.ru" class="text-gray-600 hover:text-accent transition-colors">
                      email@mail.ru
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Contact Form -->
          <div 
            v-motion
            :initial="{ opacity: 0, x: 50 }"
            :visible="{ opacity: 1, x: 0 }"
          >
            <RequestForm />
          </div>
        </div>

        <!-- Map -->
        <div class="max-w-5xl mx-auto">
          <h3 class="text-2xl font-bold text-primary mb-6 text-center">Как нас найти</h3>
          <div class="h-96 bg-background rounded-2xl overflow-hidden shadow-lg flex items-center justify-center">
            <div class="text-center text-gray-400">
              <i class="pi pi-map text-6xl mb-4"></i>
              <p class="text-lg">Карта местоположения</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
</script>

