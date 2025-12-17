<template>
  <div class="min-h-screen">
    <!-- Hero Section -->
    <section class="pt-24 pb-12">
      <div class="site-container">
        <div
          class="rounded-[44px] bg-brand-50 px-6 py-10 sm:px-10 sm:py-12 lg:px-16 lg:py-14 flex flex-col min-h-[640px] lg:min-h-[720px]"
        >
          <!-- Placeholder image block (top) -->
          <div class="flex items-center justify-center mb-12 lg:mb-14">
            <PhotoPlaceholderIcon
              class="w-20 h-20 sm:w-24 sm:h-24 opacity-60"
            />
          </div>

          <div class="mt-auto grid gap-10 lg:grid-cols-[1fr_auto] lg:items-end">
            <div>
              <h1
                class="text-[40px] leading-[0.92] sm:text-[52px] sm:leading-[0.92] md:text-[60px] md:leading-[0.92] lg:text-[72px] lg:leading-[0.92] font-black tracking-tight text-black uppercase"
                v-motion
                :initial="{ opacity: 0, y: 50 }"
                :visible="{ opacity: 1, y: 0 }"
              >
                МЕСТО ТИШИНЫ,
                <br />
                СЕМЬИ И МОЛИТВЫ
              </h1>

              <p
                class="mt-5 text-lg sm:text-xl text-black/70 max-w-xl"
                v-motion
                :initial="{ opacity: 0, y: 30 }"
                :visible="{ opacity: 1, y: 0 }"
                :delay="200"
              >
                Глэмпинг у монастыря — отдых в гармонии с душой
              </p>
            </div>

            <div
              class="flex flex-col sm:flex-row gap-4 lg:justify-end"
              v-motion
              :initial="{ opacity: 0, y: 30 }"
              :visible="{ opacity: 1, y: 0 }"
              :delay="400"
            >
              <Button
                label="Посмотреть все дома"
                class="btn-secondary !border-0 !rounded-full !px-8 !py-4 !text-base !font-medium"
                @click="$router.push('/accommodation')"
              />
              <Button
                label="Забронировать"
                class="btn-primary !rounded-full !px-8 !py-4 !text-base !font-medium"
                @click="openBooking"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Highlights (as in Figma: icon circle + label) -->
    <section class="py-14 bg-white">
      <div class="site-container">
        <ul
          class="flex flex-col items-start gap-8 sm:flex-row sm:items-center sm:justify-between sm:gap-10"
          aria-label="Ключевые особенности"
        >
          <li
            v-for="(item, index) in highlights"
            :key="item.label"
            class="flex items-center gap-6"
            v-motion
            :initial="{ opacity: 0, y: 24 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <span
              class="inline-flex shrink-0 w-16 h-16 sm:w-20 sm:h-20 rounded-full bg-brand-50"
              aria-hidden="true"
            />
            <span class="text-base sm:text-lg text-black">
              {{ item.label }}
            </span>
          </li>
        </ul>
      </div>
    </section>

    <!-- About Glamping Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            О глемпинге «Тропос»
          </h2>

          <div class="lg:pt-2">
            <p class="text-black/70 leading-relaxed">
              Глэмпинг у монастыря — отдых в гармонии с душой. Глэмпинг у
              монастыря — отдых в гармонии с душой. Глэмпинг у монастыря — отдых
              в гармонии с душой.
            </p>

            <div class="mt-8 flex items-center justify-end gap-4">
              <button
                type="button"
                class="inline-flex size-12 items-center justify-center rounded-full border border-brand-100 text-black/70 hover:text-black transition-colors"
                aria-label="Назад"
              >
                <i class="pi pi-arrow-left" />
              </button>
              <button
                type="button"
                class="inline-flex size-12 items-center justify-center rounded-full border border-brand-100 text-black/70 hover:text-black transition-colors"
                aria-label="Вперёд"
              >
                <i class="pi pi-arrow-right" />
              </button>
            </div>
          </div>
        </div>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6">
          <div
            v-for="n in 3"
            :key="n"
            class="h-72 rounded-[32px] bg-brand-50 flex items-center justify-center"
            v-motion
            :initial="{ opacity: 0, scale: 0.98 }"
            :visible="{ opacity: 1, scale: 1 }"
            :delay="n * 100"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
        </div>

        <div class="mt-10 flex justify-center">
          <Button
            label="Подробнее"
            class="btn-primary !rounded-full !px-10 !py-4 !text-base !font-medium"
            @click="$router.push('/about')"
          />
        </div>
      </div>
    </section>

    <!-- Prayer Path Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            Молитвенная тропа безмолвия
          </h2>
          <p class="text-black/70 leading-relaxed lg:pt-2">
            Глэмпинг у монастыря — отдых в гармонии с душой. Глэмпинг у
            монастыря — отдых в гармонии с душой. Глэмпинг у монастыря — отдых в
            гармонии с душой.
          </p>
        </div>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6">
          <div
            class="md:col-span-2 h-80 md:h-[520px] rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
          <div
            class="h-80 md:h-[250px] rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
          <div
            class="h-80 md:h-[250px] rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
          <div
            class="md:col-span-2 h-80 md:h-[250px] rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
        </div>
      </div>
    </section>

    <!-- Important Info Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            Важное о глэмпинге
          </h2>
          <p class="text-black/70 leading-relaxed lg:pt-2">
            Глэмпинг у монастыря — отдых в гармонии с душой.
          </p>
        </div>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6">
          <article
            v-for="(card, index) in infoCards"
            :key="card.title"
            class="relative rounded-[32px] bg-brand-50 p-8 min-h-[320px] flex flex-col"
            v-motion
            :initial="{ opacity: 0, y: 24 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <button
              type="button"
              class="absolute right-6 top-6 inline-flex size-12 items-center justify-center rounded-full bg-white text-black/60 hover:text-black transition-colors"
              aria-label="Открыть"
            >
              <i class="pi pi-arrow-right" />
            </button>

            <div class="flex-1 flex items-center justify-center">
              <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
            </div>

            <p class="mt-6 text-sm text-black/80">
              {{ card.title }}
            </p>
          </article>
        </div>

        <div class="mt-10 flex justify-center">
          <Button
            label="Забронировать"
            class="btn-primary !rounded-full !px-10 !py-4 !text-base !font-medium"
            @click="openBooking"
          />
        </div>
      </div>
    </section>

    <!-- Illustrated Map Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            Отрисованная карта
          </h2>
          <p class="text-black/70 leading-relaxed lg:pt-2">
            Схема территории и ключевые точки — чтобы быстро сориентироваться на
            месте.
          </p>
        </div>

        <div
          class="mt-12 h-80 md:h-[520px] rounded-[32px] bg-brand-50 flex items-center justify-center"
        >
          <div class="text-center text-black/60">
            <i class="pi pi-map-marker text-5xl mb-4" />
            <p class="text-base">Отрисованная карта</p>
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

  const highlights = [
    { label: 'Семейный глэмпинг' },
    { label: 'Рядом с монастырем' },
    { label: 'Природа и духовность' },
  ] as const

  const infoCards = [
    { title: 'Про номера и домики' },
    {
      title: 'Про натуральное питание (продукты, обеды в монастырской чайной)',
    },
    {
      title:
        'Досуг для детей и взрослых (игровая зона, настольные игры, прогулки, мастер‑классы)',
    },
  ] as const

  const openBooking = () => {
    isBookingDialogOpen.value = true
  }
</script>
