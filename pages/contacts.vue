<template>
  <div class="min-h-screen pt-24">
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

<script setup lang="ts"></script>
