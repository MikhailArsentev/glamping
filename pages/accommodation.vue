<template>
  <div class="min-h-screen">
    <!-- Hero -->
    <section class="pt-24 pb-12">
      <div class="site-container">
        <div
          class="mx-auto rounded-[44px] bg-brand-50 px-6 py-10 sm:px-10 sm:py-12 lg:px-16 lg:py-14"
        >
          <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
            <div>
              <h1
                class="text-[44px] leading-[0.92] sm:text-[56px] sm:leading-[0.92] lg:text-[72px] lg:leading-[0.92] font-black tracking-tight uppercase text-black"
                v-motion
                :initial="{ opacity: 0, y: 30 }"
                :visible="{ opacity: 1, y: 0 }"
              >
                ЗАГОЛОВОК
                <br />
                О ПРОЖИВАНИИ
              </h1>
              <p class="mt-5 text-lg sm:text-xl text-black/70 max-w-xl">
                Подзаголовок про проживание в глэмпинге или какой-то слоган
              </p>
            </div>

            <div
              class="grid grid-cols-2 gap-x-12 gap-y-10 justify-items-end text-right"
              v-motion
              :initial="{ opacity: 0, y: 20 }"
              :visible="{ opacity: 1, y: 0 }"
              :delay="200"
            >
              <div
                v-for="stat in stats"
                :key="stat.label"
              >
                <div class="text-4xl sm:text-5xl font-semibold text-black">
                  {{ stat.value }}
                </div>
                <div class="mt-2 text-sm sm:text-base text-black/70">
                  {{ stat.label }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Houses Grid Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <h2 class="text-3xl md:text-4xl font-bold text-black mx-auto">
          Заголовок заголовок заголовок
        </h2>

        <div class="mt-12 grid grid-cols-1 lg:grid-cols-2 gap-10 mx-auto">
          <HouseCard
            v-for="(house, index) in houses"
            :key="index"
            :title="house.title"
            :description="house.description"
            :guests-badge="house.guestsBadge"
            :area="house.area"
            :details-title="house.detailsTitle"
            :details="house.details"
            :delay="index * 100"
            @book="openBookingDialog"
          />
        </div>
      </div>
    </section>

    <!-- Booking Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 mx-auto">
          <div>
            <h3 class="text-2xl font-bold text-black">Забронировать домик</h3>
            <p class="mt-3 text-black/70 leading-relaxed">
              Оставьте заявку — мы свяжемся с вами и поможем подобрать
              подходящий вариант.
            </p>
          </div>
          <RequestForm variant="soft" />
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
  import Dialog from 'primevue/dialog'

  const isBookingDialogOpen = ref(false)

  const stats = [
    { value: 10, label: 'домиков' },
    { value: 10, label: 'гектаров' },
    { value: 10, label: 'мероприятий' },
    { value: 10, label: 'событий' },
  ]

  const houses = [
    {
      title: 'Название дома',
      description:
        'Описание дома Описание дома Описание дома Описание дома Описание дома',
      guestsBadge: '4 гостя',
      area: '40 м²',
      detailsTitle: 'Ранний заезд/выезд',
      details: [
        'Заезд: с 14:00',
        'Выезд: до 12:00',
        'Ранний заезд — по согласованию',
      ],
    },
    {
      title: 'Название дома',
      description:
        'Описание дома Описание дома Описание дома Описание дома Описание дома',
      guestsBadge: '4 гостя',
      area: '40 м²',
      detailsTitle: 'Что внутри домика',
      details: ['Кровать', 'Санузел', 'Теплый пол', 'Посуда', 'Wi‑Fi'],
    },
    {
      title: 'Название дома',
      description:
        'Описание дома Описание дома Описание дома Описание дома Описание дома',
      guestsBadge: '4 гостя',
      area: '40 м²',
      detailsTitle: 'Что внутри домика',
      details: ['Кровать', 'Санузел', 'Теплый пол', 'Посуда', 'Wi‑Fi'],
    },
    {
      title: 'Название дома',
      description:
        'Описание дома Описание дома Описание дома Описание дома Описание дома',
      guestsBadge: '4 гостя',
      area: '40 м²',
      detailsTitle: 'Что внутри домика',
      details: ['Кровать', 'Санузел', 'Теплый пол', 'Посуда', 'Wi‑Fi'],
    },
    {
      title: 'Название дома',
      description:
        'Описание дома Описание дома Описание дома Описание дома Описание дома',
      guestsBadge: '4 гостя',
      area: '40 м²',
      detailsTitle: 'Что внутри домика',
      details: ['Кровать', 'Санузел', 'Теплый пол', 'Посуда', 'Wi‑Fi'],
    },
    {
      title: 'Название дома',
      description:
        'Описание дома Описание дома Описание дома Описание дома Описание дома',
      guestsBadge: '4 гостя',
      area: '40 м²',
      detailsTitle: 'Что внутри домика',
      details: ['Кровать', 'Санузел', 'Теплый пол', 'Посуда', 'Wi‑Fi'],
    },
  ]

  const openBookingDialog = () => {
    isBookingDialogOpen.value = true
  }
</script>
