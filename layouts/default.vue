<template>
  <div class="min-h-screen flex flex-col bg-background">
    <TheHeader />
    <main class="flex-1">
      <slot />
    </main>
    <TheFooter />
    <Toast position="top-right" />
  </div>
</template>

<script setup lang="ts">
  import Toast from 'primevue/toast'
</script>
