import { useToast } from 'primevue/usetoast'

export interface BookingData {
  checkIn: Date | null
  checkOut: Date | null
  guests: number
  name: string
  phone: string
  email: string
}

export const useBooking = () => {
  const toast = useToast()

  const submitBooking = async (data: BookingData) => {
    try {
      // TODO: Заменить на реальный API endpoint
      // const response = await $fetch('/api/bookings', {
      //   method: 'POST',
      //   body: data
      // })

      // Симуляция API запроса
      await new Promise(resolve => setTimeout(resolve, 1500))

      toast.add({
        severity: 'success',
        summary: 'Бронирование принято',
        detail: 'Мы свяжемся с вами в ближайшее время для подтверждения',
        life: 5000
      })

      return { success: true }
    } catch (error) {
      toast.add({
        severity: 'error',
        summary: 'Ошибка',
        detail: 'Не удалось отправить заявку. Попробуйте позже или позвоните нам.',
        life: 5000
      })

      return { success: false, error }
    }
  }

  return {
    submitBooking
  }
}

