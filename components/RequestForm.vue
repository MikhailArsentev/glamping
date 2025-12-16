<template>
  <div class="bg-white rounded-2xl p-8 shadow-lg">
    <h3 class="text-2xl font-bold text-primary mb-6">Оставить заявку</h3>
    <p class="text-gray-600 mb-6">Свяжитесь с нами и мы ответим вам в течение 30 минут</p>
    
    <form @submit.prevent="handleSubmit" class="space-y-4">
      <div class="flex flex-col">
        <InputText 
          v-model="formData.name" 
          placeholder="Ваше имя"
          class="w-full"
        />
      </div>

      <div class="flex flex-col">
        <InputMask 
          v-model="formData.phone" 
          mask="+7 (999) 999-99-99"
          placeholder="+7 (___) ___-__-__"
          class="w-full"
        />
      </div>

      <Button 
        type="submit" 
        label="Отправить" 
        :loading="isSubmitting"
        class="w-full bg-primary text-white py-3 rounded-lg hover:bg-primary-light transition-colors"
      />
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useToast } from 'primevue/usetoast'
import InputText from 'primevue/inputtext'
import InputMask from 'primevue/inputmask'
import Button from 'primevue/button'

const toast = useToast()
const isSubmitting = ref(false)

const formData = reactive({
  name: '',
  phone: ''
})

const handleSubmit = async () => {
  if (!formData.name || !formData.phone) {
    toast.add({ severity: 'warn', summary: 'Внимание', detail: 'Заполните все поля', life: 3000 })
    return
  }

  isSubmitting.value = true

  try {
    // TODO: Replace with actual API call
    await new Promise(resolve => setTimeout(resolve, 1500))
    
    toast.add({ 
      severity: 'success', 
      summary: 'Успешно', 
      detail: 'Ваша заявка принята! Мы свяжемся с вами в ближайшее время.', 
      life: 5000 
    })
    
    formData.name = ''
    formData.phone = ''
  } catch (error) {
    toast.add({ 
      severity: 'error', 
      summary: 'Ошибка', 
      detail: 'Не удалось отправить заявку. Попробуйте позже.', 
      life: 5000 
    })
  } finally {
    isSubmitting.value = false
  }
}
</script>

