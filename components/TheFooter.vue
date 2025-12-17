<template>
  <footer class="bg-white mt-20">
    <div class="site-container pb-12">
      <div class="rounded-[44px] bg-brand-50 p-6 sm:p-10 lg:p-14">
        <div class="grid gap-8 lg:grid-cols-[420px_1fr] lg:items-stretch">
          <div class="rounded-[32px] bg-white p-6 sm:p-8">
            <h3 class="text-3xl font-bold text-black">Контакты</h3>

            <ul class="mt-6 space-y-4 text-black/80">
              <li class="flex items-center gap-4">
                <span
                  class="inline-flex size-10 rounded-full bg-brand-50"
                  aria-hidden="true"
                />
                <span class="text-sm">Уличная улица, д. 1, к. 3</span>
              </li>
              <li class="flex items-center gap-4">
                <span
                  class="inline-flex size-10 rounded-full bg-brand-50"
                  aria-hidden="true"
                />
                <a
                  class="text-sm hover:underline"
                  href="tel:+77777777777"
                >
                  +7 777 777 77 77
                </a>
              </li>
              <li class="flex items-center gap-4">
                <span
                  class="inline-flex size-10 rounded-full bg-brand-50"
                  aria-hidden="true"
                />
                <a
                  class="text-sm hover:underline"
                  href="mailto:email@email.ru"
                >
                  email@email.ru
                </a>
              </li>
            </ul>

            <div class="mt-10 text-sm text-black/60">Яндекс.Карты</div>
          </div>

          <div
            class="rounded-[32px] bg-brand-50 flex items-center justify-center"
          >
            <div class="text-brand-200">
              <i
                class="pi pi-map-marker text-5xl"
                aria-hidden="true"
              />
            </div>
          </div>
        </div>
      </div>

      <div
        class="mt-10 grid grid-cols-1 gap-4 text-sm text-black/60 md:grid-cols-3 md:items-center"
      >
        <div class="flex items-center justify-center md:justify-start gap-3">
          <div
            class="size-8 rounded-full bg-brand-100 flex items-center justify-center"
          >
            <span class="text-brand-200 text-xs">logo</span>
          </div>
          <span>© 2025. Все права защищены</span>
        </div>

        <div class="flex justify-center">
          <NuxtLink
            to="/privacy"
            class="hover:text-black transition-colors"
          >
            Политика конфиденциальности
          </NuxtLink>
        </div>

        <div class="flex justify-center md:justify-end">
          <NuxtLink
            to="/contacts"
            class="hover:text-black transition-colors"
          >
            Условия и положения
          </NuxtLink>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts"></script>
