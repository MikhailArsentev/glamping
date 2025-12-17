<template>
  <div class="min-h-screen">
    <!-- Hero -->
    <section class="pt-24 pb-12">
      <div class="site-container">
        <div
          class="rounded-[44px] bg-brand-50 px-6 py-10 sm:px-10 sm:py-12 lg:px-16 lg:py-14"
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
                О ГЛЭМПИНГЕ
              </h1>
              <p class="mt-6 text-lg sm:text-xl text-black/70 max-w-xl">
                Подзаголовок про преимущества глэмпинга или какой-то слоган
              </p>
            </div>

            <div
              class="grid grid-cols-2 gap-x-16 gap-y-12 justify-items-end text-right"
              v-motion
              :initial="{ opacity: 0, y: 20 }"
              :visible="{ opacity: 1, y: 0 }"
              :delay="200"
            >
              <div
                v-for="stat in stats"
                :key="stat.label"
              >
                <div class="text-5xl font-semibold text-black">
                  {{ stat.value }}
                </div>
                <div class="mt-3 text-base text-black/70">{{ stat.label }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Timeline Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            История создания глэмпинга
          </h2>
          <p class="text-black/70 leading-relaxed lg:pt-2">
            Глэмпинг у монастыря — отдых в гармонии с душой. Глэмпинг у
            монастыря — отдых в гармонии с душой. Глэмпинг у монастыря — отдых в
            гармонии с душой.
          </p>
        </div>

        <!-- Timeline -->
        <div class="mt-14 max-w-5xl mx-auto">
          <div class="relative">
            <!-- Timeline Line -->
            <div
              class="absolute left-1/2 -translate-x-1/2 w-px h-full bg-secondary"
            ></div>

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
              <div
                :class="[
                  'flex items-center gap-8',
                  index % 2 === 0 ? 'flex-row' : 'flex-row-reverse',
                ]"
              >
                <div
                  :class="[
                    'flex-1',
                    index % 2 === 0 ? 'text-right' : 'text-left',
                  ]"
                >
                  <div
                    :class="[
                      'timeline-card bg-brand-50 rounded-[28px] p-7 inline-block max-w-md',
                      index % 2 === 0
                        ? 'timeline-card--left'
                        : 'timeline-card--right',
                    ]"
                  >
                    <h3 class="text-2xl font-bold text-black mb-2">
                      {{ item.year }}
                    </h3>
                    <p class="text-black/70">{{ item.description }}</p>
                  </div>
                </div>

                <!-- Timeline Dot -->
                <div
                  class="w-3 h-3 bg-brand-50 rounded-full ring-8 ring-white z-10 bg-secondary"
                ></div>

                <div class="flex-1"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Mission Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            Миссия глэмпинга
          </h2>
          <p class="text-black/70 leading-relaxed lg:pt-2">
            Глэмпинг у монастыря — отдых в гармонии с душой. Глэмпинг у
            монастыря — отдых в гармонии с душой.
          </p>
        </div>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6">
          <article
            v-for="(mission, index) in missions"
            :key="mission.title"
            class="rounded-[32px] bg-brand-50 p-8"
            v-motion
            :initial="{ opacity: 0, y: 30 }"
            :visible="{ opacity: 1, y: 0 }"
            :delay="index * 100"
          >
            <h3 class="text-xl font-semibold text-black">
              {{ mission.title }}
            </h3>
            <p class="mt-3 text-black/70">{{ mission.description }}</p>
          </article>
        </div>
      </div>
    </section>

    <!-- Photo Gallery Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start">
          <h2 class="text-3xl md:text-4xl font-bold text-black">
            Фото домиков, интерьеры, инфраструктура
          </h2>
          <p class="text-black/70 leading-relaxed lg:pt-2">
            Глэмпинг у монастыря — отдых в гармонии с душой. Глэмпинг у
            монастыря — отдых в гармонии с душой.
          </p>
        </div>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6">
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
            class="md:row-span-2 h-80 md:h-[520px] rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
          <div
            class="md:col-span-2 h-80 md:h-[250px] rounded-[32px] bg-brand-50 flex items-center justify-center"
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
            class="h-80 md:h-[250px] rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
          </div>
        </div>
      </div>
    </section>

    <!-- Booking Section -->
    <section class="py-20 bg-white">
      <div class="site-container">
        <div
          class="grid gap-10 lg:grid-cols-[1.2fr_1fr] lg:items-start max-w-5xl mx-auto"
        >
          <div
            v-motion
            :initial="{ opacity: 0, x: -30 }"
            :visible="{ opacity: 1, x: 0 }"
          >
            <h1 class="text-3xl md:text-4xl font-bold text-black">
              Забронировать домик
            </h1>
            <p class="mt-4 text-black/70 leading-relaxed">
              Оставьте заявку — мы свяжемся с вами и поможем подобрать
              подходящий вариант.
            </p>
            <p class="mt-6 text-sm text-black/60">Vana-kaarma 1, k. 3</p>
          </div>

          <div
            v-motion
            :initial="{ opacity: 0, x: 30 }"
            :visible="{ opacity: 1, x: 0 }"
          >
            <RequestForm variant="soft" />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
  const stats = [
    { value: 10, label: 'домиков' },
    { value: 10, label: 'гектаров' },
    { value: 10, label: 'мероприятий' },
    { value: 10, label: 'событий' },
  ]

  const timeline = [
    { year: '2020 г', description: 'Основана история хозяйства/глэмпинга' },
    { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
    { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
    { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
    { year: '2020 г', description: 'Описание истории создания/глэмпинга' },
  ]

  const missions = [
    {
      title: 'Миссия 1',
      description: 'Подробнее об основных целях, миссии, что...',
    },
    {
      title: 'Миссия 2',
      description: 'Подробнее об основных целях, миссии, что...',
    },
    {
      title: 'Миссия 3',
      description: 'Подробнее об основных целях, миссии, что...',
    },
  ]
</script>

<style scoped>
  .timeline-card {
    position: relative;
  }

  .timeline-card--left::after {
    content: '';
    position: absolute;
    top: 50%;
    right: -10px;
    transform: translateY(-50%);
    width: 0;
    height: 0;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
    border-left: 10px solid #f0f3ff; /* brand.50 */
  }

  .timeline-card--right::after {
    content: '';
    position: absolute;
    top: 50%;
    left: -10px;
    transform: translateY(-50%);
    width: 0;
    height: 0;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
    border-right: 10px solid #f0f3ff; /* brand.50 */
  }
</style>
