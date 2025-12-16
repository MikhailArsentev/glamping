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
            ЗАГОЛОВОК<br />О ПРОЖИВАНИИ
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

    <!-- Houses Grid Section -->
    <section class="py-20 bg-white">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12 text-center">
          Заголовок заголовок заголовок
        </h2>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
          <HouseCard
            v-for="(house, index) in houses"
            :key="index"
            :title="house.title"
            :description="house.description"
            :price="house.price"
            :amenities="house.amenities"
            :delay="index * 100"
            @book="openBookingDialog"
            @details="showHouseDetails(house)"
          />
        </div>
      </div>
    </section>

    <!-- Booking Section -->
    <section class="py-20 bg-background">
      <div class="container mx-auto px-4 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12 text-center">
          Забронировать домик
        </h2>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-5xl mx-auto">
          <div class="bg-white rounded-2xl p-8">
            <h3 class="text-2xl font-bold text-primary mb-6">Забронировать домик</h3>
            <p class="text-gray-600 mb-6">Глэмпинг с монастырём — отдых в гармонии с душой. Глэмпинг с монастырём — отдых в гармонии с душой.</p>
            <Button 
              label="Отправить" 
              class="w-full bg-primary text-white py-3 rounded-lg hover:bg-primary-light transition-colors"
              @click="openBookingDialog"
            />
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

const stats = [
  { value: 10, label: 'домиков' },
  { value: 10, label: 'гектаров' },
  { value: 10, label: 'мероприятий' },
  { value: 10, label: 'событий' }
]

const houses = [
  {
    title: 'Название дома',
    description: 'Описание дома Описание дома Описание дома Описание дома Описание дома Описание дома',
    price: '10000 ₽',
    amenities: [
      'Вмещает до 4 человек',
      'Освещение в помещении',
      'Освещение на участке',
      'Забор',
      'Место для костра с навесом',
      'Мангал/мангал с казаном/мангал',
      'Спальные'
    ]
  },
  {
    title: 'Название дома',
    description: 'Описание дома Описание дома Описание дома Описание дома Описание дома Описание дома',
    price: '10000 ₽',
    amenities: [
      'Вмещает до 4 человек',
      'Освещение в помещении',
      'Освещение на участке',
      'Забор',
      'Место для костра с навесом',
      'Мангал/мангал с казаном/мангал',
      'Спальные'
    ]
  },
  {
    title: 'Название дома',
    description: 'Описание дома Описание дома Описание дома Описание дома Описание дома Описание дома',
    price: '10000 ₽',
    amenities: [
      'Вмещает до 4 человек',
      'Освещение в помещении',
      'Освещение на участке',
      'Забор',
      'Место для костра с навесом',
      'Мангал/мангал с казаном/мангал',
      'Спальные'
    ]
  },
  {
    title: 'Название дома',
    description: 'Описание дома Описание дома Описание дома Описание дома Описание дома Описание дома',
    price: '10000 ₽',
    amenities: [
      'Вмещает до 4 человек',
      'Освещение в помещении',
      'Освещение на участке',
      'Забор',
      'Место для костра с навесом',
      'Мангал/мангал с казаном/мангал',
      'Спальные'
    ]
  },
  {
    title: 'Название дома',
    description: 'Описание дома Описание дома Описание дома Описание дома Описание дома Описание дома',
    price: '10000 ₽',
    amenities: [
      'Вмещает до 4 человек',
      'Освещение в помещении',
      'Освещение на участке',
      'Забор',
      'Место для костра с навесом',
      'Мангал/мангал с казаном/мангал',
      'Спальные'
    ]
  },
  {
    title: 'Название дома',
    description: 'Описание дома Описание дома Описание дома Описание дома Описание дома Описание дома',
    price: '10000 ₽',
    amenities: [
      'Вмещает до 4 человек',
      'Освещение в помещении',
      'Освещение на участке',
      'Забор',
      'Место для костра с навесом',
      'Мангал/мангал с казаном/мангал',
      'Спальные'
    ]
  }
]

const openBookingDialog = () => {
  isBookingDialogOpen.value = true
}

const showHouseDetails = (house: any) => {
  console.log('Show details for:', house)
}
</script>

