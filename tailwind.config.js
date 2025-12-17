/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./app.vue",
  ],
  theme: {
    extend: {
      container: {
        center: true,
        // Cap the site width to 1328px on large screens
        screens: {
          xl: '1328px',
          '2xl': '1328px',
        },
      },
      colors: {
        primary: {
          DEFAULT: '#000000',
          light: '#1a1a1a',
        },
        accent: {
          DEFAULT: '#B3C5FF',
          light: '#D4DFFF',
          dark: '#8FA3E6',
        },
        background: {
          DEFAULT: '#F5F6FA',
          light: '#FFFFFF',
          dark: '#E8EAEF',
        },
        // Palette used in the header + hero to match the provided mock
        brand: {
          50: '#F0F3FF',  // hero card background
          100: '#EEF2FF', // logo bubble background
          200: '#C5D8FF', // secondary CTA background
          600: '#3E68FF', // active link color
        },
      },
      fontFamily: {
        sans: ['Manrope', 'system-ui', 'sans-serif'],
      },
      maxWidth: {
        site: '1328px',
      },
      animation: {
        'fade-in': 'fadeIn 0.6s ease-out',
        'slide-up': 'slideUp 0.6s ease-out',
        'scale-up': 'scaleUp 0.3s ease-out',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { transform: 'translateY(20px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        },
        scaleUp: {
          '0%': { transform: 'scale(0.95)', opacity: '0' },
          '100%': { transform: 'scale(1)', opacity: '1' },
        },
      },
    },
  },
  plugins: [],
}

