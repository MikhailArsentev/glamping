<template>
  <div class="min-h-screen">
    <!-- Hero Section -->
    <section class="relative min-h-screen flex items-center justify-center bg-gradient-to-br from-accent-light to-background pt-20">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="max-w-4xl mx-auto text-center">
          <h1 
            class="text-4xl md:text-6xl lg:text-7xl font-bold text-primary mb-6 leading-tight"
            v-motion
            :initial="{ opacity: 0, y: 50 }"
            :visible="{ opacity: 1, y: 0 }"
          >
            МЕСТО ТИШИНЫ,<br />СЕМЬИ И МОЛИТВЫ
          </h1>
          
          <p 
            class="text-lg md:text-xl text-gray-700 mb-8 max-w-2xl mx-auto"
            v-motion
            :initial="{ opacity: 0, y: 30 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="200"
          >
            Глэмпинг с монастырём — отдых в гармонии с душой
          </p>

          <div 
            class="flex flex-col sm:flex-row gap-4 justify-center"
            v-motion
            :initial="{ opacity: 0, y: 30 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="400"
          >
            <Button 
              label="Посмотреть всё дома" 
              class="bg-primary text-white px-8 py-3 rounded-full text-lg hover:bg-primary-light transition-colors"
              @click="$router.push('/accommodation')"
            />
            <Button 
              label="Забронировать" 
              outlined
              class="border-2 border-primary text-primary px-8 py-3 rounded-full text-lg hover:bg-primary/5 transition-colors"
              @click="openBooking"
            />
          </div>
        </div>
      </div>

      <!-- Placeholder for hero image -->
      <div class="absolute inset-0 -z-10 opacity-20">
        <div class="w-full h-full flex items-center justify-center">
          <i class="pi pi-image text-9xl text-gray-300"></i>
        </div>
      </div>
    </section>

    <!-- Feature Cards -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div 
            v-for="(feature, index) in features" 
            :key="index"
            class="bg-background rounded-2xl p-8 text-center hover:shadow-lg transition-shadow"
            v-motion
            :initial="{ opacity: 0, y: 50 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <div class="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
              <i :class="feature.icon" class="text-3xl text-primary"></i>
            </div>
            <h3 class="text-xl font-bold text-primary mb-3">{{ feature.title }}</h3>
            <p class="text-gray-600">{{ feature.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- About Glamping Section -->
    <section class="py-20 bg-background">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="text-center mb-12">
          <h2 class="text-3xl md:text-4xl font-bold text-primary mb-4">О глэмпинге «Тропос»</h2>
          <div class="max-w-3xl mx-auto">
            <p class="text-gray-600 leading-relaxed">
              Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
            </p>
          </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <div 
            v-for="n in 3" 
            :key="n"
            class="h-64 bg-white rounded-2xl overflow-hidden shadow-lg"
            v-motion
            :initial="{ opacity: 0, scale: 0.9 }"
            :visible="{ opacity: 1, scale: 1 }"
            :delay="n * 100"
          >
            <div class="w-full h-full flex items-center justify-center bg-background">
              <i class="pi pi-image text-6xl text-gray-300"></i>
            </div>
          </div>
        </div>

        <div class="text-center">
          <Button 
            label="Подробнее" 
            class="bg-primary text-white px-8 py-3 rounded-full hover:bg-primary-light transition-colors"
            @click="$router.push('/about')"
          />
        </div>
      </div>
    </section>

    <!-- Prayer Path Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-4 text-center">Молитвенная тропа безмолвия</h2>
        <div class="max-w-3xl mx-auto text-center mb-12">
          <p class="text-gray-600 leading-relaxed">
            Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <div 
            v-for="n in 4" 
            :key="n"
            class="h-64 bg-background rounded-2xl overflow-hidden shadow-lg"
            v-motion
            :initial="{ opacity: 0, y: 50 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="n * 100"
          >
            <div class="w-full h-full flex items-center justify-center">
              <i class="pi pi-image text-6xl text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Important Info Section -->
    <section class="py-20 bg-background">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12 text-center">Важное о глэмпинге</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
          <div 
            v-for="(info, index) in importantInfo" 
            :key="index"
            class="bg-white rounded-2xl p-8"
            v-motion
            :initial="{ opacity: 0, y: 50 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <h3 class="font-bold text-lg text-primary mb-4">{{ info.title }}</h3>
            <p class="text-gray-600 text-sm">{{ info.description }}</p>
          </div>
        </div>

        <div class="text-center">
          <Button 
            label="Забронировать" 
            class="bg-primary text-white px-8 py-3 rounded-full hover:bg-primary-light transition-colors"
            @click="openBooking"
          />
        </div>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12 text-center">Контакты</h2>
        
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-5xl mx-auto">
          <div>
            <div class="space-y-6 mb-8">
              <div>
                <h3 class="font-bold text-lg text-primary mb-2">Адрес</h3>
                <p class="text-gray-600">Vana-kaarma 1, k. 3</p>
              </div>
              <div>
                <h3 class="font-bold text-lg text-primary mb-2">Телефон</h3>
                <a href="tel:+77777777777" class="text-gray-600 hover:text-accent transition-colors">+7 777 777 77 77</a>
              </div>
              <div>
                <h3 class="font-bold text-lg text-primary mb-2">Email</h3>
                <a href="mailto:email@mail.ru" class="text-gray-600 hover:text-accent transition-colors">email@mail.ru</a>
              </div>
            </div>

            <div class="h-64 bg-background rounded-2xl flex items-center justify-center">
              <div class="text-center text-gray-400">
                <i class="pi pi-map text-5xl mb-2"></i>
                <p class="text-sm">Карта</p>
              </div>
            </div>
          </div>

          <div>
            <RequestForm />
          </div>
        </div>
      </div>
    </section>

    <!-- Booking Dialog -->
    <Dialog 
      v-model:visible="isBookingDialogOpen" 
      modal 
      header="Забронировать домик"
      :style="{ width: '90vw', maxWidth: '600px' }"
    >
      <BookingForm @success="isBookingDialogOpen = false" />
    </Dialog>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Button from 'primevue/button'
import Dialog from 'primevue/dialog'

const isBookingDialogOpen = ref(false)

const features = [
  {
    icon: 'pi pi-users',
    title: 'Семейный глэмпинг',
    description: 'Идеальное место для семейного отдыха с детьми'
  },
  {
    icon: 'pi pi-heart',
    title: 'Родительские молитвы',
    description: 'Молитвенная тропа для духовного обновления'
  },
  {
    icon: 'pi pi-sun',
    title: 'Природа и покой',
    description: 'Единение с природой и гармония с собой'
  }
]

const importantInfo = [
  {
    title: 'При заселении можно',
    description: 'Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.'
  },
  {
    title: 'При заселении нельзя (общая и индивидуальная баня)',
    description: 'Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.'
  },
  {
    title: 'Досуг для детей и взрослых (прокат, есть бассейн, квадроциклы, мастер классы)',
    description: 'Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.'
  }
]

const openBooking = () => {
  isBookingDialogOpen.value = true
}
</script>

