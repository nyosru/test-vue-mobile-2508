<template>
  <div class="drawings-selector">
    <!-- Блок с показом картинок -->
    <div class="drawings-container">
      <div class="drawings-grid">
        <div
            v-for="(drawing, index) in visibleDrawings"
            :key="drawing.id"
            class="drawing-item"
            :style="{ '--index': index }"
        >
          <div class="drawing-content">
            {{ drawing.value }}
          </div>
        </div>
      </div>
    </div>

    <!-- Панель с кнопками выбора -->
    <div class="buttons-panel">
      <button
          v-for="number in [1, 3, 5]"
          :key="number"
          class="number-button"
          :class="{ active: activeCount === number }"
          @click="handleNumberSelect(number)"
      >
        {{ number }}
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue'

const props = defineProps({
  modelValue: {
    type: Number,
    default: 1
  }
})

const emit = defineEmits(['update:modelValue'])

const activeCount = ref(props.modelValue)
const drawings = ref(generateDrawings())

// Генерируем случайные рисунки
function generateDrawings() {
  const numbers = Array.from({ length: 9 }, () =>
      Math.floor(Math.random() * 9) + 1
  )
  return numbers.map((value, index) => ({
    id: Date.now() + index,
    value: value
  }))
}

// Видимые рисунки в зависимости от выбранного количества
const visibleDrawings = computed(() => {
  return drawings.value.slice(0, activeCount.value)
})

// Обработчик выбора числа
function handleNumberSelect(number) {
  activeCount.value = number
  emit('update:modelValue', number)
}

// Следим за изменениями извне
watch(() => props.modelValue, (newValue) => {
  activeCount.value = newValue
})

// Функция для обновления рисунков (можно вызывать из родителя)
function updateDrawings() {
  drawings.value = generateDrawings()
}

// Экспортируем функцию для обновления
defineExpose({
  updateDrawings
})
</script>

<style scoped>
.drawings-selector {
  width: 100%;
  margin: 20px 0;
}

.drawings-container {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
  overflow: hidden;
}

.drawings-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  max-width: 300px;
  width: 100%;
}

.drawing-item {
  aspect-ratio: 1;
  perspective: 1000px;
}

.drawing-content {
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 2rem;
  font-weight: bold;
  color: #333;
  box-shadow:
      0 10px 30px rgba(0, 0, 0, 0.3),
      inset 0 -4px 10px rgba(0, 0, 0, 0.1);
  transform-style: preserve-3d;
  backface-visibility: hidden;
  animation: pulse 2s ease-in-out infinite;
  animation-delay: calc(var(--index) * 0.2s);
}

/* Панель с кнопками */
.buttons-panel {
  background-color: #333;
  display: flex;
  gap: 16px;
  padding: 16px;
  border-radius: 12px;
  justify-content: center;
  margin: 0 auto;
  max-width: 300px;
}

.number-button {
  width: 60px;
  height: 60px;
  border: 2px solid #999;
  background-color: transparent;
  color: white;
  font-size: 1.5rem;
  font-weight: bold;
  cursor: pointer;
  border-radius: 50%;
  transition: all 0.3s ease;
}

.number-button:hover {
  border-color: #007bff;
  transform: translateY(-2px);
}

.number-button.active {
  border-color: #007bff;
  background-color: #007bff;
  transform: scale(1.1);
  box-shadow: 0 0 20px rgba(0, 123, 255, 0.5);
}

/* Анимации */
@keyframes pulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
}

.drawing-fade-enter-active,
.drawing-fade-leave-active {
  transition: all 0.6s ease;
}

.drawing-fade-enter-from {
  opacity: 0;
  transform: translateY(100px) rotateX(90deg) scale(0.5);
}

.drawing-fade-enter-to {
  opacity: 1;
  transform: translateY(0) rotateX(0deg) scale(1);
  transition-delay: calc(var(--index) * 0.1s);
}

.drawing-fade-leave-active {
  position: absolute;
  transition: all 0.4s ease;
}

.drawing-fade-leave-to {
  opacity: 0;
  transform: translateY(-100px) rotateX(-90deg) scale(0.5);
}

/* Адаптивность */
@media (max-width: 480px) {
  .drawings-grid {
    gap: 12px;
  }

  .drawing-content {
    font-size: 1.5rem;
    border-radius: 15px;
  }

  .number-button {
    width: 50px;
    height: 50px;
    font-size: 1.2rem;
  }

  .buttons-panel {
    padding: 12px;
    gap: 12px;
  }
}
</style>