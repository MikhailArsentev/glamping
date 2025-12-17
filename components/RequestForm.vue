<template>
  <div :class="rootClass">
    <h3 class="text-2xl font-bold text-black mb-4">Оставить заявку</h3>
    <p class="text-black/70 mb-6">
      Свяжитесь с нами и мы ответим вам в течение 30 минут
    </p>

    <form
      @submit.prevent="handleSubmit"
      class="space-y-4"
    >
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

      <div class="pt-2">
        <Button
          type="submit"
          label="Отправить"
          :loading="isSubmitting"
          :class="submitClass"
        />
      </div>
    </form>
  </div>
</template>

<script setup lang="ts">
  import { computed, ref, reactive } from 'vue'
  import { useToast } from 'primevue/usetoast'
  import InputText from 'primevue/inputtext'
  import InputMask from 'primevue/inputmask'
  import Button from 'primevue/button'
  import { useRequest } from '~/composables/useRequest'

  const isSubmitting = ref(false)
  const toast = useToast()
  const { submitRequest } = useRequest()

  const props = withDefaults(defineProps<{ variant?: 'default' | 'soft' }>(), {
    variant: 'default',
  })

  const rootClass = computed(() => {
    if (props.variant === 'soft') {
      return 'rounded-[32px] bg-brand-50 p-8 border border-brand-100'
    }
    return 'bg-white rounded-2xl p-8 shadow-lg'
  })

  const submitClass = computed(() => {
    if (props.variant === 'soft') {
      return 'btn-primary !rounded-full !px-8 !py-3 !text-sm !font-medium !w-auto'
    }
    return 'w-full btn-primary !rounded-full !py-4'
  })

  const formData = reactive({
    name: '',
    phone: '',
  })

  const handleSubmit = async () => {
    if (!formData.name || !formData.phone) {
      toast.add({
        severity: 'warn',
        summary: 'Внимание',
        detail: 'Заполните все поля',
        life: 3000,
      })
      return
    }

    isSubmitting.value = true

    try {
      const result = await submitRequest({
        name: formData.name,
        phone: formData.phone,
      })
      if (!result.success) return

      formData.name = ''
      formData.phone = ''
    } finally {
      isSubmitting.value = false
    }
  }
</script>
