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
            ДОСУГ
          </h1>
          <p class="text-lg text-gray-700">
            Активный отдых и развлечения для всей семьи
          </p>
        </div>
      </div>
    </section>

    <!-- Activities Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="max-w-4xl mx-auto mb-12">
          <p class="text-gray-600 leading-relaxed text-center">
            Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div 
            v-for="(activity, index) in activities" 
            :key="index"
            class="bg-background rounded-2xl p-8"
            v-motion
            :initial="{ opacity: 0, y: 50 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <div class="w-full h-48 bg-white rounded-xl flex items-center justify-center mb-6">
              <PhotoPlaceholderIcon class="w-12 h-12 opacity-80" />
            </div>
            <h3 class="text-xl font-bold text-primary mb-3">{{ activity.title }}</h3>
            <p class="text-gray-600">{{ activity.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Gallery Section -->
    <section class="py-20 bg-background">
      <div class="site-container">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12 text-center">Фотогалерея</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div 
            v-for="n in 6" 
            :key="n"
            class="h-64 bg-white rounded-2xl overflow-hidden"
            v-motion
            :initial="{ opacity: 0, scale: 0.9 }"
            :visible="{ opacity: 1, scale: 1 }"
            :delay="n * 50"
          >
            <div class="w-full h-full flex items-center justify-center">
              <PhotoPlaceholderIcon class="w-12 h-12 opacity-80" />
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
const activities = [
  {
    title: 'Молитвенная тропа',
    description: 'Уединенная тропа для духовных размышлений и молитвы'
  },
  {
    title: 'Прогулки на природе',
    description: 'Пешие прогулки по живописным местам'
  },
  {
    title: 'Мастер-классы',
    description: 'Различные мастер-классы для детей и взрослых'
  },
  {
    title: 'Баня и SPA',
    description: 'Традиционная баня и спа-процедуры'
  },
  {
    title: 'Велопрогулки',
    description: 'Прокат велосипедов для всей семьи'
  },
  {
    title: 'Детская площадка',
    description: 'Безопасная игровая зона для детей'
  }
]
</script>

