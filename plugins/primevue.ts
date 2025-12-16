import { defineNuxtPlugin } from '#app'
import PrimeVue from 'primevue/config'
import ToastService from 'primevue/toastservice'
import Button from 'primevue/button'
import InputText from 'primevue/inputtext'
import Calendar from 'primevue/calendar'
import InputNumber from 'primevue/inputnumber'
import InputMask from 'primevue/inputmask'
import Toast from 'primevue/toast'
import Dialog from 'primevue/dialog'
import Sidebar from 'primevue/sidebar'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.use(PrimeVue, {
    ripple: true,
    inputStyle: 'filled'
  })
  nuxtApp.vueApp.use(ToastService)

  // Register components globally
  nuxtApp.vueApp.component('Button', Button)
  nuxtApp.vueApp.component('InputText', InputText)
  nuxtApp.vueApp.component('Calendar', Calendar)
  nuxtApp.vueApp.component('InputNumber', InputNumber)
  nuxtApp.vueApp.component('InputMask', InputMask)
  nuxtApp.vueApp.component('Toast', Toast)
  nuxtApp.vueApp.component('Dialog', Dialog)
  nuxtApp.vueApp.component('Sidebar', Sidebar)
})

