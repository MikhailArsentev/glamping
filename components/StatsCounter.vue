<template>
  <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
    <div 
      v-for="(stat, index) in stats" 
      :key="index"
      class="text-center"
      v-motion
      :initial="{ opacity: 0, scale: 0.5 }"
      :visible="{ opacity: 1, scale: 1 }"
      :delay="index * 100"
    >
      <div class="text-4xl md:text-5xl font-bold text-primary mb-2">
        {{ animatedValues[index] }}
      </div>
      <div class="text-sm md:text-base text-gray-600">{{ stat.label }}</div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useIntersectionObserver } from '@vueuse/core'

interface Stat {
  value: number
  label: string
}

interface Props {
  stats: Stat[]
}

const props = defineProps<Props>()

const animatedValues = ref(props.stats.map(() => 0))
const target = ref(null)
const hasAnimated = ref(false)

useIntersectionObserver(
  target,
  ([{ isIntersecting }]) => {
    if (isIntersecting && !hasAnimated.value) {
      hasAnimated.value = true
      animateCounters()
    }
  }
)

const animateCounters = () => {
  props.stats.forEach((stat, index) => {
    const duration = 2000
    const steps = 60
    const increment = stat.value / steps
    let current = 0

    const timer = setInterval(() => {
      current += increment
      if (current >= stat.value) {
        animatedValues.value[index] = stat.value
        clearInterval(timer)
      } else {
        animatedValues.value[index] = Math.floor(current)
      }
    }, duration / steps)
  })
}

onMounted(() => {
  target.value = document.body
})
</script>

