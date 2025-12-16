<template>
  <header 
    :class="[
      'fixed top-0 left-0 right-0 z-50 transition-all duration-300',
      isScrolled ? 'bg-white shadow-md py-3' : 'bg-transparent py-5'
    ]"
  >
    <div class="container mx-auto px-4 lg:px-8">
      <div class="flex items-center justify-between">
        <!-- Logo -->
        <NuxtLink to="/" class="flex items-center space-x-2">
          <div class="w-10 h-10 bg-primary rounded-full flex items-center justify-center">
            <span class="text-white font-bold text-lg">Т</span>
          </div>
          <span class="text-xl font-bold text-primary hidden md:block">ТРОПОС</span>
        </NuxtLink>

        <!-- Desktop Navigation -->
        <nav class="hidden lg:flex items-center space-x-8">
          <NuxtLink 
            v-for="item in menuItems" 
            :key="item.path"
            :to="item.path"
            :class="[
              'text-sm font-medium transition-colors hover:text-accent',
              isScrolled ? 'text-gray-700' : 'text-gray-800'
            ]"
          >
            {{ item.label }}
          </NuxtLink>
        </nav>

        <!-- CTA Button -->
        <div class="hidden lg:flex items-center space-x-4">
          <Button 
            label="Забронировать" 
            class="bg-primary text-white px-6 py-2 rounded-full hover:bg-primary-light transition-colors"
            @click="openBookingDialog"
          />
        </div>

        <!-- Mobile Menu Button -->
        <button 
          class="lg:hidden p-2"
          @click="isMobileMenuOpen = true"
        >
          <i class="pi pi-bars text-2xl text-primary"></i>
        </button>
      </div>
    </div>

    <!-- Mobile Sidebar -->
    <Sidebar v-model:visible="isMobileMenuOpen" position="right" class="w-80">
      <template #header>
        <div class="flex items-center space-x-2">
          <div class="w-10 h-10 bg-primary rounded-full flex items-center justify-center">
            <span class="text-white font-bold text-lg">Т</span>
          </div>
          <span class="text-xl font-bold text-primary">ТРОПОС</span>
        </div>
      </template>
      
      <nav class="flex flex-col space-y-4 mt-8">
        <NuxtLink 
          v-for="item in menuItems" 
          :key="item.path"
          :to="item.path"
          class="text-lg font-medium text-gray-700 hover:text-accent transition-colors py-2"
          @click="isMobileMenuOpen = false"
        >
          {{ item.label }}
        </NuxtLink>
        
        <Button 
          label="Забронировать" 
          class="bg-primary text-white w-full mt-4 rounded-full"
          @click="() => { isMobileMenuOpen = false; openBookingDialog(); }"
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
import { ref, onMounted, onUnmounted } from 'vue'
import Button from 'primevue/button'
import Sidebar from 'primevue/sidebar'
import Dialog from 'primevue/dialog'

const isScrolled = ref(false)
const isMobileMenuOpen = ref(false)
const isBookingDialogOpen = ref(false)

const menuItems = [
  { label: 'ГЛАВНАЯ', path: '/' },
  { label: 'О ГЛЭМПИНГЕ', path: '/about' },
  { label: 'ПРОЖИВАНИЕ', path: '/accommodation' },
  { label: 'ПИТАНИЕ', path: '/food' },
  { label: 'ДОСУГ', path: '/leisure' },
  { label: 'КОНТАКТЫ', path: '/contacts' },
]

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const openBookingDialog = () => {
  isBookingDialogOpen.value = true
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

