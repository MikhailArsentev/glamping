<template>
  <article
    class="rounded-[32px] border border-brand-100 bg-white overflow-hidden"
    v-motion
    :initial="{ opacity: 0, y: 30 }"
    :visible="{ opacity: 1, y: 0 }"
    :delay="delay"
  >
    <!-- Image -->
    <div class="h-60 bg-brand-50 flex items-center justify-center">
      <PhotoPlaceholderIcon class="w-14 h-14 opacity-60" />
    </div>

    <!-- Content -->
    <div class="p-6">
      <div class="flex items-start justify-between gap-4">
        <h3 class="text-xl sm:text-2xl font-semibold text-black leading-tight">
          {{ title }}
        </h3>
        <span
          v-if="guestsBadge"
          class="shrink-0 inline-flex items-center justify-center px-3 py-1.5 rounded-full bg-brand-50 text-brand-600 text-xs font-medium"
        >
          {{ guestsBadge }}
        </span>
      </div>

      <p class="mt-3 text-sm sm:text-base text-black/70 leading-relaxed">
        {{ description }}
      </p>

      <div class="mt-4 flex items-center gap-2 flex-wrap">
        <span
          v-for="(_, idx) in iconChips"
          :key="idx"
          class="inline-flex size-8 items-center justify-center rounded-full bg-brand-50 text-brand-600"
          aria-hidden="true"
        >
          <!-- icons placeholder -->
        </span>

        <span
          v-if="area"
          class="inline-flex items-center justify-center px-3 py-1.5 rounded-full bg-brand-50 text-brand-600 text-xs font-medium"
        >
          {{ area }}
        </span>
      </div>

      <Transition name="collapse">
        <div
          v-if="isExpanded"
          class="mt-4"
        >
          <h4
            v-if="detailsTitle"
            class="text-sm font-semibold text-black"
          >
            {{ detailsTitle }}
          </h4>
          <ul
            v-if="details?.length"
            class="mt-2 space-y-1 text-sm text-black/70"
          >
            <li
              v-for="(row, idx) in details"
              :key="idx"
              class="flex gap-2"
            >
              <span
                class="mt-[7px] size-1.5 rounded-full bg-brand-600 shrink-0"
              />
              <span>{{ row }}</span>
            </li>
          </ul>
        </div>
      </Transition>

      <div class="mt-6 flex items-center gap-3">
        <Button
          label="Забронировать"
          class="btn-primary !rounded-full !px-5 !py-3 !text-sm !font-medium"
          @click="$emit('book')"
        />
        <Button
          :label="isExpanded ? 'Скрыть' : 'Подробнее'"
          class="btn-secondary !border-0 !rounded-full !px-5 !py-3 !text-sm !font-medium"
          @click="toggleDetails"
        />
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
  import { ref } from 'vue'
  import Button from 'primevue/button'

  interface Props {
    title: string
    description: string
    guestsBadge?: string
    area?: string
    detailsTitle?: string
    details?: string[]
    delay?: number
  }

  defineProps<Props>()
  defineEmits(['book'])
  const iconChips = [1, 2, 3, 4]

  const isExpanded = ref(false)
  const toggleDetails = () => {
    isExpanded.value = !isExpanded.value
  }
</script>

<style scoped>
  .collapse-enter-active,
  .collapse-leave-active {
    transition: max-height 220ms ease, opacity 220ms ease;
    overflow: hidden;
  }

  .collapse-enter-from,
  .collapse-leave-to {
    max-height: 0;
    opacity: 0;
  }

  .collapse-enter-to,
  .collapse-leave-from {
    max-height: 240px;
    opacity: 1;
  }
</style>
