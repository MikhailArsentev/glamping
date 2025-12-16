<template>
  <form @submit.prevent="handleSubmit" class="space-y-4">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
      <div class="flex flex-col">
        <label class="text-sm font-medium text-gray-700 mb-2">Дата заезда</label>
        <Calendar 
          v-model="formData.checkIn" 
          :minDate="minDate"
          dateFormat="dd.mm.yy"
          placeholder="Выберите дату"
          class="w-full"
        />
      </div>
      
      <div class="flex flex-col">
        <label class="text-sm font-medium text-gray-700 mb-2">Дата выезда</label>
        <Calendar 
          v-model="formData.checkOut" 
          :minDate="formData.checkIn || minDate"
          dateFormat="dd.mm.yy"
          placeholder="Выберите дату"
          class="w-full"
        />
      </div>
    </div>

    <div class="flex flex-col">
      <label class="text-sm font-medium text-gray-700 mb-2">Количество гостей</label>
      <InputNumber 
        v-model="formData.guests" 
        :min="1" 
        :max="10"
        placeholder="Количество гостей"
        class="w-full"
      />
    </div>

    <div class="flex flex-col">
      <label class="text-sm font-medium text-gray-700 mb-2">Имя</label>
      <InputText 
        v-model="formData.name" 
        placeholder="Ваше имя"
        class="w-full"
      />
    </div>

    <div class="flex flex-col">
      <label class="text-sm font-medium text-gray-700 mb-2">Телефон</label>
      <InputMask 
        v-model="formData.phone" 
        mask="+7 (999) 999-99-99"
        placeholder="+7 (___) ___-__-__"
        class="w-full"
      />
    </div>

    <div class="flex flex-col">
      <label class="text-sm font-medium text-gray-700 mb-2">Email</label>
      <InputText 
        v-model="formData.email" 
        type="email"
        placeholder="email@example.com"
        class="w-full"
      />
    </div>

    <Button 
      type="submit" 
      label="Забронировать" 
      :loading="isSubmitting"
      class="w-full bg-primary text-white py-3 rounded-lg hover:bg-primary-light transition-colors"
    />
  </form>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useToast } from 'primevue/usetoast'
import Calendar from 'primevue/calendar'
import InputNumber from 'primevue/inputnumber'
import InputText from 'primevue/inputtext'
import InputMask from 'primevue/inputmask'
import Button from 'primevue/button'

const emit = defineEmits(['success'])
const toast = useToast()

const isSubmitting = ref(false)
const minDate = ref(new Date())

const formData = reactive({
  checkIn: null,
  checkOut: null,
  guests: 2,
  name: '',
  phone: '',
  email: ''
})

const handleSubmit = async () => {
  // Validation
  if (!formData.checkIn || !formData.checkOut) {
    toast.add({ severity: 'warn', summary: 'Внимание', detail: 'Укажите даты проживания', life: 3000 })
    return
  }
  
  if (!formData.name || !formData.phone) {
    toast.add({ severity: 'warn', summary: 'Внимание', detail: 'Заполните обязательные поля', life: 3000 })
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
    
    // Reset form
    Object.assign(formData, {
      checkIn: null,
      checkOut: null,
      guests: 2,
      name: '',
      phone: '',
      email: ''
    })
    
    emit('success')
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

