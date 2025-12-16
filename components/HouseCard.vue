<template>
  <div 
    class="bg-white rounded-2xl overflow-hidden shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-1"
    v-motion
    :initial="{ opacity: 0, y: 50 }"
    :visible="{ opacity: 1, y: 0 }"
    :delay="delay"
  >
    <!-- Image Gallery -->
    <div class="relative h-64 bg-background group">
      <div class="absolute inset-0 flex items-center justify-center">
        <i class="pi pi-image text-6xl text-gray-300"></i>
      </div>
      
      <!-- Navigation Arrows -->
      <button 
        class="absolute left-4 top-1/2 -translate-y-1/2 w-10 h-10 bg-white/80 rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
        @click="prevImage"
      >
        <i class="pi pi-chevron-left text-primary"></i>
      </button>
      <button 
        class="absolute right-4 top-1/2 -translate-y-1/2 w-10 h-10 bg-white/80 rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
        @click="nextImage"
      >
        <i class="pi pi-chevron-right text-primary"></i>
      </button>

      <!-- Badge -->
      <div class="absolute top-4 right-4 bg-accent text-primary px-3 py-1 rounded-full text-sm font-medium">
        {{ price }}
      </div>
    </div>

    <!-- Content -->
    <div class="p-6">
      <h3 class="text-xl font-bold text-primary mb-3">{{ title }}</h3>
      <p class="text-gray-600 text-sm mb-4 line-clamp-2">{{ description }}</p>

      <!-- Amenities -->
      <div class="mb-6">
        <p class="text-sm font-medium text-gray-700 mb-2">Условия бронирования:</p>
        <ul class="space-y-1 text-sm text-gray-600">
          <li v-for="(amenity, index) in amenities" :key="index" class="flex items-start">
            <i class="pi pi-check text-accent text-xs mt-1 mr-2"></i>
            <span>{{ amenity }}</span>
          </li>
        </ul>
      </div>

      <!-- Actions -->
      <div class="flex gap-3">
        <Button 
          label="Забронировать" 
          class="flex-1 bg-primary text-white py-2 rounded-lg hover:bg-primary-light transition-colors"
          @click="$emit('book')"
        />
        <Button 
          label="Подробнее" 
          outlined
          class="flex-1 border-2 border-accent text-primary py-2 rounded-lg hover:bg-accent/10 transition-colors"
          @click="$emit('details')"
        />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Button from 'primevue/button'

interface Props {
  title: string
  description: string
  price: string
  amenities: string[]
  delay?: number
}

defineProps<Props>()
defineEmits(['book', 'details'])

const currentImageIndex = ref(0)

const prevImage = () => {
  // Handle image navigation
  currentImageIndex.value = (currentImageIndex.value - 1) % 3
}

const nextImage = () => {
  // Handle image navigation
  currentImageIndex.value = (currentImageIndex.value + 1) % 3
}
</script>

