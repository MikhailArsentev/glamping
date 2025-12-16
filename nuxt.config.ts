// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: false },
  
  modules: [
    '@nuxtjs/tailwindcss',
    '@vueuse/motion/nuxt',
    '@nuxt/image'
  ],

  tailwindcss: {
    cssPath: '~/assets/css/tailwind.css',
    configPath: 'tailwind.config.js',
    exposeConfig: false,
    viewer: false
  },

  // Явно включаем роутинг на основе файлов
  pages: true,
  
  // Настройки совместимости
  future: {
    compatibilityVersion: 4
  },

  // Hot Module Replacement (HMR) настройки
  vite: {
    server: {
      hmr: {
        protocol: 'ws',
        host: 'localhost',
        port: 24678,
        clientPort: 24678
      },
      watch: {
        usePolling: false,
        interval: 100
      }
    },
    // Оптимизация для быстрой пересборки
    optimizeDeps: {
      include: ['vue', 'vue-router', '@vueuse/core', '@vueuse/motion']
    }
  },

  app: {
    head: {
      title: 'Глэмпинг Тропос - Место тишины, семьи и молитвы',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'Глэмпинг с монастырём — отдых в гармонии с душой. Семейный глэмпинг с монастырём' }
      ],
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'stylesheet', href: '/primevue.css' }
      ]
    }
  },

  css: ['primeicons/primeicons.css']
})
