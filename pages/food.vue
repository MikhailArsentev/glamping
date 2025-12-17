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
            ПИТАНИЕ
          </h1>
          <p class="text-lg text-gray-700">
            Вкусная и полезная еда для вашего комфортного отдыха
          </p>
        </div>
      </div>
    </section>

    <!-- Content Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="max-w-4xl mx-auto">
          <div class="prose prose-lg max-w-none mb-12">
            <p class="text-gray-600 leading-relaxed">
              Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
            <div 
              v-for="n in 4" 
              :key="n"
              class="h-64 bg-background rounded-2xl overflow-hidden"
              v-motion
              :initial="{ opacity: 0, scale: 0.9 }"
              :visible="{ opacity: 1, scale: 1 }"
              :delay="n * 100"
            >
              <div class="w-full h-full flex items-center justify-center">
                <PhotoPlaceholderIcon class="w-12 h-12 opacity-80" />
              </div>
            </div>
          </div>

          <div class="bg-background rounded-2xl p-8">
            <h3 class="text-2xl font-bold text-primary mb-6 text-center">Оставить заявку на питание</h3>
            <RequestForm />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
</script>

