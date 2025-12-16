// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: false },
  
  modules: [
    '@nuxtjs/tailwindcss',
    '@vueuse/motion/nuxt',
    '@nuxt/image'
  ],

  // Явно включаем роутинг на основе файлов
  pages: true,
  
  // Настройки совместимости
  future: {
    compatibilityVersion: 4
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
