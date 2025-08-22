<template>

  <div class="row9">

<!--    777-->

<!--    &lt;!&ndash; Контейнер для рисунков &ndash;&gt;-->
    <div class="drawings-container">
      <transition-group name="drawing-fade" tag="div" class="drawings-grid">
        <div
            v-for="(drawing, index) in visibleDrawings"
            :key="drawing.id"
            class="drawing-item"
            :style="{ '--index': index }"
        >
          <div class="drawing-content">
            <!--            🎨-->
            <img src="@/assets/777.svg" alt="drawing" width="100px"
                 xheight="100"
            >
          </div>
        </div>
      </transition-group>
    </div>


  </div>

  <div class="row10"
  >

    <!-- Панель с кнопками -->
    <div class="buttons-panel">
      <button
          v-for="number in [1, 3, 5]"
          :key="number"
          class="number-button"
          :class="{ active: activeCount === number }"
          @click="showDrawings(number)"
      >
        {{ number }}
      </button>
    </div>
    <button class="run_button">&nbsp;</button>

  </div>

  <div>
    <div class="type-select">
      покажи мне кнопки
      <button
          v-for="option in options"
          :key="option.value"
          class="option-button"
          :class="{ active: selected === option.value }"
          @click="selectOption(option.value)"
      >
        {{ option.label }}
      </button>
    </div>

  </div>
</template>


<script setup>
import {ref, watch} from 'vue';

// const props = defineProps({
//   options: {
//     type: Array,
//     required: true,
//     default: () => []
//   },
//   modelValue: {
//     type: [String, Number],
//     default: null
//   }
// });
//
// const emit = defineEmits(['update:modelValue']);
//
// const selected = ref(props.modelValue);
//
// watch(
//     () => props.modelValue,
//     (newVal) => {
//       selected.value = newVal;
//     }
// );
//
// const selectOption = (value) => {
//   selected.value = value;
//   emit('update:modelValue', value);
// };
//
//
// Генерируем уникальные ID для рисунков
const generateDrawings = (count) => {
  return Array.from({length: count}, (_, i) => ({
    id: Date.now() + i,
    content: '🎨'
  }))
}
//
//
// Показываем рисунки
const showDrawings = (count) => {
  activeCount.value = count
  drawings.value = generateDrawings(count)
}
//
// // Видимые рисунки (для анимации)
const visibleDrawings = computed(() => drawings.value)

</script>

<style scoped>

.type-select {
  background-color: #333; /* Тёмно-серый фон */
  display: flex;
  gap: 8px;
  padding: 8px;
  border-radius: 6px;
}

.option-button {
  border: 2px solid #999; /* Серая граница */
  background-color: transparent;
  color: white;
  padding: 8px 16px;
  cursor: pointer;
  border-radius: 4px;
  transition: border-color 0.3s ease;
}

.option-button.active {
  border-color: #007bff; /* Синяя граница для активной кнопки */
}


/* Контейнер для рисунков */
.drawings-container {
  flex: 1;
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

/* Стили для рисунка */
.drawing-item {
  aspect-ratio: 1;
  perspective: 1000px;
}

.drawing-content {
  width: 100%;
  height: 100%;

  xbackground: rgba(255, 255, 255, 0.95);
  xbox-shadow: 0 10px 30px rgba(0, 0, 0, 0.3),
  inset 0 -4px 10px rgba(0, 0, 0, 0.1);

  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 2rem;
  transform-style: preserve-3d;
  backface-visibility: hidden;
}


/* Панель с кнопками */
/*
.buttons-panel {
  xbackground: rgba(255, 255, 255, 0.95);
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  padding: 20px;
  border-top-left-radius: 30px;
  border-top-right-radius: 30px;
  display: flex;
  justify-content: space-around;
  box-shadow: 0 -5px 25px rgba(0, 0, 0, 0.15);
}

.number-button {
  width: 60px;
  height: 60px;
  border: none;
  border-radius: 50%;
  background: linear-gradient(145deg, #667eea, #764ba2);
  color: white;
  xfont-size: 1.5rem;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 5px 15px rgba(0, ͟0, 0, 0.2),
  inset 0 -3px 10px rgba(0, 0, 0, 0.2);
}

.number-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3),
  inset 0 -3px 10px rgba(0, 0, 0, 0.2);
}

.number-button.active {
  background: linear-gradient(145deg, #ff6b6b, #ee5a52);
  transform: scale(1.1);
  box-shadow: 0 10px 25px rgba(255, 107, 107, 0.4),
  inset 0 -3px 10px rgba(0, 0, 0, 0.2);
}
*/


/* Анимации появления рисунков */
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

/* Адаптивность для мобильных */
@media (max-width: 480px) {
  .drawings-grid {
    grid-template-columns: repeat(3, 1fr);
    gap: 12px;
    justify-content: center;
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
    padding: 15px;
    border-top-left-radius: 25px;
    border-top-right-radius: 25px;
  }
}

/* Анимация пульсации для привлечения внимания */
@keyframes pulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
}

.drawing-content {
  animation: pulse 2s ease-in-out infinite;
  animation-delay: calc(var(--index) * 0.2s);
}


</style>