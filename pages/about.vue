<template>
  <div class="min-h-screen pt-20">
    <!-- Hero Section with Stats -->
    <section class="bg-accent-light py-20">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="max-w-4xl mx-auto text-center mb-12">
          <h1 
            class="text-4xl md:text-5xl font-bold text-primary mb-6"
            v-motion
            :initial="{ opacity: 0, y: 30 }"
            :visible="{ opacity: 1, y: 0 }"
          >
            ЗАГОЛОВОК<br />О ГЛЭМПИНГЕ
          </h1>
          <p class="text-lg text-gray-700">
            Подзаголовок про проживание в глэмпинге или какая-то слоган
          </p>
        </div>

        <!-- Stats Counter -->
        <div v-motion :initial="{ opacity: 0, y: 30 }" :visible="{ opacity: 1, y: 0 }" :delay="200">
          <StatsCounter :stats="stats" />
        </div>
      </div>
    </section>

    <!-- Timeline Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-4 text-center">История создания глэмпинга</h2>
        <div class="max-w-3xl mx-auto text-center mb-16">
          <p class="text-gray-600 leading-relaxed">
            Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
          </p>
        </div>

        <!-- Timeline -->
        <div class="max-w-4xl mx-auto">
          <div class="relative">
            <!-- Timeline Line -->
            <div class="absolute left-1/2 transform -translate-x-1/2 w-0.5 h-full bg-accent"></div>

            <!-- Timeline Items -->
            <div 
              v-for="(item, index) in timeline" 
              :key="index"
              class="relative mb-12"
              v-motion
              :initial="{ opacity: 0, x: index % 2 === 0 ? -50 : 50 }"
              :visible="{ opacity: 1, x: 0 }"
              :delay="index * 150"
            >
              <div :class="[
                'flex items-center gap-8',
                index % 2 === 0 ? 'flex-row' : 'flex-row-reverse'
              ]">
                <div :class="[
                  'flex-1',
                  index % 2 === 0 ? 'text-right' : 'text-left'
                ]">
                  <div class="bg-accent-light rounded-2xl p-6 inline-block">
                    <h3 class="text-2xl font-bold text-primary mb-2">{{ item.year }}</h3>
                    <p class="text-gray-600">{{ item.description }}</p>
                  </div>
                </div>
                
                <!-- Timeline Dot -->
                <div class="w-4 h-4 bg-accent rounded-full border-4 border-white z-10"></div>
                
                <div class="flex-1"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Mission Section -->
    <section class="py-20 bg-background">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-4 text-center">Миссия глэмпинга</h2>
        <div class="max-w-3xl mx-auto text-center mb-16">
          <p class="text-gray-600 leading-relaxed">
            Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div 
            v-for="(mission, index) in missions" 
            :key="index"
            class="bg-white rounded-2xl p-8"
            v-motion
            :initial="{ opacity: 0, y: 50 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <div class="mb-6">
              <div class="w-full h-48 bg-background rounded-xl flex items-center justify-center">
                <i class="pi pi-image text-6xl text-gray-300"></i>
              </div>
            </div>
            <h3 class="text-xl font-bold text-primary mb-3">{{ mission.title }}</h3>
            <p class="text-gray-600">{{ mission.description }}</p>
          </div>
        </div>

        <div class="text-center mt-12">
          <Button 
            label="Подробнее" 
            class="btn-primary px-8 py-3 rounded-full"
          />
        </div>
      </div>
    </section>

    <!-- Photo Gallery Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12 text-center">
          Фото домиков, интерьеры, инфраструктура
        </h2>
        
        <div class="max-w-3xl mx-auto text-center mb-12">
          <p class="text-gray-600 leading-relaxed">
            Здесь будут фото домиков — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
          <div 
            v-for="n in 9" 
            :key="n"
            :class="[
              'bg-background rounded-2xl overflow-hidden',
              n === 4 ? 'md:col-span-2 h-96' : 'h-64'
            ]"
            v-motion
            :initial="{ opacity: 0, scale: 0.9 }"
            :visible="{ opacity: 1, scale: 1 }"
            :delay="n * 50"
          >
            <div class="w-full h-full flex items-center justify-center">
              <i class="pi pi-image text-6xl text-gray-300"></i>
            </div>
          </div>
        </div>

        <div class="text-center">
          <Button 
            label="Посмотреть все" 
            outlined
            class="border-2 border-primary text-primary px-8 py-3 rounded-full hover:bg-primary/5 transition-colors"
          />
        </div>
      </div>
    </section>

    <!-- Map Section -->
    <section class="py-20 bg-background">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="max-w-4xl mx-auto">
          <div class="h-96 bg-white rounded-2xl overflow-hidden shadow-lg flex items-center justify-center">
            <div class="text-center text-gray-400">
              <i class="pi pi-map text-6xl mb-4"></i>
              <p class="text-lg">Карта местоположения</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Booking Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-5xl mx-auto">
          <div class="bg-background rounded-2xl p-8">
            <h3 class="text-2xl font-bold text-primary mb-6">Забронировать домик</h3>
            <p class="text-gray-600 mb-6">Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём.</p>
            <BookingForm @success="handleBookingSuccess" />
          </div>

          <div>
            <RequestForm />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { useToast } from 'primevue/usetoast'
import Button from 'primevue/button'

const toast = useToast()

const stats = [
  { value: 10, label: 'домиков' },
  { value: 10, label: 'гектаров' },
  { value: 10, label: 'мероприятий' },
  { value: 10, label: 'событий' }
]

const timeline = [
  { year: '2020 г', description: 'Основана история хозяйства/глэмпинга' },
  { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
  { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
  { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
  { year: '2020 г', description: 'Описание истории создания/глэмпинга' }
]

const missions = [
  {
    title: 'Миссия 1',
    description: 'Подробнее об основных целях, миссии, что...'
  },
  {
    title: 'Миссия 2',
    description: 'Подробнее об основных целях, миссии, что...'
  },
  {
    title: 'Миссия 3',
    description: 'Подробнее об основных целях, миссии, что...'
  }
]

const handleBookingSuccess = () => {
  toast.add({ 
    severity: 'success', 
    summary: 'Успешно', 
    detail: 'Бронирование отправлено!', 
    life: 3000 
  })
}
</script>

