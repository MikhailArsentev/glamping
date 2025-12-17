<template>
  <header class="fixed top-0 left-0 right-0 z-50 bg-white py-5">
    <div class="site-container">
      <div class="flex items-center justify-between">
        <!-- Logo -->
        <NuxtLink
          to="/"
          class="flex items-center space-x-2"
        >
          <div
            class="w-12 h-12 bg-brand-100 rounded-full flex items-center justify-center"
          >
            <span class="text-brand-200 font-medium text-sm">logo</span>
          </div>
        </NuxtLink>

        <!-- Desktop Navigation -->
        <nav class="hidden lg:flex items-center gap-10">
          <NuxtLink
            v-for="item in menuItems"
            :key="item.path"
            :to="item.path"
            :class="[
              'text-base font-normal transition-colors hover:text-brand-600',
              isActive(item.path) ? 'text-brand-600' : 'text-black',
            ]"
          >
            {{ item.label }}
          </NuxtLink>
        </nav>

        <!-- CTA Button -->
        <div class="hidden lg:flex items-center space-x-4">
          <Button
            label="Забронировать"
            class="btn-primary !rounded-full !px-8 !py-4 !text-base !font-medium"
            @click="openBookingDialog"
          />
        </div>

        <!-- Mobile Menu Button -->
        <button
          class="lg:hidden p-2"
          @click="isMobileMenuOpen = true"
        >
          <i class="pi pi-bars text-2xl text-black"></i>
        </button>
      </div>
    </div>

    <!-- Mobile Sidebar -->
    <Sidebar
      v-model:visible="isMobileMenuOpen"
      position="right"
      class="w-80"
    >
      <template #header>
        <div class="flex items-center space-x-2">
          <div
            class="w-12 h-12 bg-brand-100 rounded-full flex items-center justify-center"
          >
            <span class="text-brand-200 font-medium text-sm">logo</span>
          </div>
        </div>
      </template>

      <nav class="flex flex-col space-y-4 mt-8">
        <NuxtLink
          v-for="item in menuItems"
          :key="item.path"
          :to="item.path"
          :class="[
            'text-lg font-medium transition-colors py-2',
            isActive(item.path) ? 'text-brand-600' : 'text-gray-700',
            'hover:text-brand-600',
          ]"
          @click="isMobileMenuOpen = false"
        >
          {{ item.label }}
        </NuxtLink>

        <Button
          label="Забронировать"
          class="btn-primary w-full mt-4 !rounded-full !py-3"
          @click="
            () => {
              isMobileMenuOpen = false
              openBookingDialog()
            }
          "
        />
      </nav>
    </Sidebar>

    <!-- Booking Dialog -->
    <Dialog
      v-model:visible="isBookingDialogOpen"
      modal
      header="Забронировать домик"
      :style="{ width: '90vw', maxWidth: '600px' }"
    >
      <BookingForm @success="isBookingDialogOpen = false" />
    </Dialog>
  </header>
</template>

<script setup lang="ts">
  import { computed, ref } from 'vue'
  import Button from 'primevue/button'
  import Sidebar from 'primevue/sidebar'
  import Dialog from 'primevue/dialog'

  const isMobileMenuOpen = ref(false)
  const isBookingDialogOpen = ref(false)

  const menuItems = [
    { label: 'Главная', path: '/' },
    { label: 'О глэмпинге', path: '/about' },
    { label: 'Проживание', path: '/accommodation' },
    { label: 'Питание', path: '/food' },
    { label: 'Досуг', path: '/leisure' },
    { label: 'Контакты', path: '/contacts' },
  ]

  const route = useRoute()
  const currentPath = computed(() => route.path)

  const isActive = (path: string) => {
    // only exact match for now (keeps behavior predictable)
    return currentPath.value === path
  }

  const openBookingDialog = () => {
    isBookingDialogOpen.value = true
  }
</script>
