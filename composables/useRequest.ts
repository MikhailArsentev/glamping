import { useToast } from 'primevue/usetoast'

export interface RequestData {
  name: string
  phone: string
  message?: string
}

export const useRequest = () => {
  const toast = useToast()

  const submitRequest = async (data: RequestData) => {
    try {
      // TODO: Заменить на реальный API endpoint
      // const response = await $fetch('/api/requests', {
      //   method: 'POST',
      //   body: data
      // })

      // Симуляция API запроса
      await new Promise(resolve => setTimeout(resolve, 1500))

      toast.add({
        severity: 'success',
        summary: 'Заявка отправлена',
        detail: 'Мы свяжемся с вами в течение 30 минут',
        life: 5000
      })

      return { success: true }
    } catch (error) {
      toast.add({
        severity: 'error',
        summary: 'Ошибка',
        detail: 'Не удалось отправить заявку. Попробуйте позже.',
        life: 5000
      })

      return { success: false, error }
    }
  }

  return {
    submitRequest
  }
}

