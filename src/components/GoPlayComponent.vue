<template>
  <div class="drawings-component">
    <!-- Контейнер для рисунков -->
    <div class="drawings-container">
      <transition-group
          name="drawing-fade"
          tag="div"
          class="drawings-grid"
          :class="{ 'five-items': activeCount === 5 }"
          :style="gridStyle"
      >
        <div
            v-for="(drawing, index) in visibleDrawings"
            :key="drawing.id"
            class="drawing-item"
            :style="{
            '--index': index,
            '--size': drawingSize
          }"
        >
          <div class="drawing-content">
            <img src="@/assets/777.svg" alt="drawing" class="drawing-image">
          </div>
        </div>
      </transition-group>
    </div>

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

    <div class="btn_spin">
      <img src="/img/but1.png" />
    </div>

  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

const activeCount = ref(1)
const drawings = ref([])

// Генерируем уникальные ID для рисунков
const generateDrawings = (count) => {
  return Array.from({ length: count }, (_, i) => ({
    id: Date.now() + i,
  }))
}

// Показываем рисунки
const showDrawings = (count) => {
  activeCount.value = count
  drawings.value = generateDrawings(count)
}

// Видимые рисунки
const visibleDrawings = computed(() => drawings.value)

// Размер рисунка в зависимости от количества
const drawingSize = computed(() => {
  switch (activeCount.value) {
    case 1: return '180px'
    case 3: return '130px'
    case 5: return '100px'
    default: return '100px'
  }
})

// Динамические стили для сетки
const gridStyle = computed(() => {
  if (activeCount.value === 5) {
    return {
      'grid-template-columns': 'repeat(3, 1fr)',
      'grid-template-rows': 'repeat(2, 1fr)',
      'gap': '16px'
    }
  }

  const columns = activeCount.value <= 3 ? activeCount.value : 3
  return {
    'grid-template-columns': `repeat(${columns}, 1fr)`,
    'gap': activeCount.value === 1 ? '0' : '16px'
  }
})

// Инициализация при монтировании компонента
onMounted(() => {
  showDrawings(1) // Показываем 1 рисунок при загрузке
})
</script>

<style scoped>
.drawings-component {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

/* Контейнер для рисунков */
.drawings-container {
  height: 250px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  overflow: hidden;
}

.drawings-grid {
  display: grid;
  width: 100%;
  max-width: 500px;
  height: 100%;
  align-items: center;
  justify-items: center;
}

/* Специальные стили для 5 элементов */
.drawings-grid.five-items {
  grid-template-areas:
    "item1 item2 item3"
    "item4 item5 .";
}

/* Позиционируем элементы для 5 картинок */
.drawings-grid.five-items .drawing-item:nth-child(1) { grid-area: item1; }
.drawings-grid.five-items .drawing-item:nth-child(2) { grid-area: item2; }
.drawings-grid.five-items .drawing-item:nth-child(3) { grid-area: item3; }
.drawings-grid.five-items .drawing-item:nth-child(4) { grid-area: item4; }
.drawings-grid.five-items .drawing-item:nth-child(5) { grid-area: item5; }

/* Альтернативный способ центрирования для 5 элементов */
.drawings-grid.five-items {
  position: relative;
}

.drawings-grid.five-items::after {
  content: '';
  grid-column: 2;
  grid-row: 2;
  visibility: hidden;
}

/* Стили для рисунка */
.drawing-item {
  width: var(--size, 100px);
  height: var(--size, 100px);
  transition: all 0.3s ease;
}

.drawing-content {
  width: 100%;
  height: 100%;
  background: transparent;
  border-radius: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.drawing-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  padding: 5px;
  filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.3));
}

/* Панель с кнопками */
.buttons-panel {
  display: flex;
  justify-content: center;
  gap: 12px;
  padding: 0 20px;
}

.number-button {
  flex: 1;
  max-width: 30%;
  height: 50px;
  border: 2px solid #666;
  border-radius: 12px;
  background-color: #444;
  color: white;
  font-size: 1.2rem;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
}

.number-button:hover {
  border-color: #888;
  background-color: #555;
}

.number-button.active {
  border-color: #007bff;
  background: linear-gradient(145deg, #007bff, #0056b3);
  transform: scale(1.05);
  box-shadow:
      0 4px 15px rgba(0, 123, 255, 0.3),
      inset 0 -2px 6px rgba(0, 0, 0, 0.2);
}

/* Анимации */
.drawing-fade-enter-active,
.drawing-fade-leave-active {
  transition: all 0.5s ease;
}

.drawing-fade-enter-from {
  opacity: 0;
  transform:
      translateY(30px)
      rotateX(60deg)
      scale(0.8);
}

.drawing-fade-enter-to {
  opacity: 1;
  transform:
      translateY(0)
      rotateX(0deg)
      scale(1);
  transition-delay: calc(var(--index) * 0.1s);
}

.drawing-fade-leave-active {
  position: absolute;
  transition: all 0.3s ease;
}

.drawing-fade-leave-to {
  opacity: 0;
  transform:
      translateY(-30px)
      rotateX(-60deg)
      scale(0.8);
}

/* Анимация пульсации */
@keyframes pulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.08);
  }
}

.drawing-image {
  animation: pulse 2.5s ease-in-out infinite;
  animation-delay: calc(var(--index) * 0.15s);
}

/* Адаптивность для мобильных */
@media (max-width: 480px) {
  .drawings-container {
    height: 200px;
  }

  .drawing-item {
    width: calc(var(--size, 100px) * 0.9) !important;
    height: calc(var(--size, 100px) * 0.9) !important;
  }

  .number-button {
    height: 45px;
    font-size: 1.1rem;
  }
}

@media (max-width: 320px) {
  .drawings-container {
    height: 180px;
  }

  .drawing-item {
    width: calc(var(--size, 100px) * 0.8) !important;
    height: calc(var(--size, 100px) * 0.8) !important;
  }

  .number-button {
    height: 40px;
    font-size: 1rem;
  }
}

/* Простой способ центрирования для 5 элементов */
.drawings-grid.five-items {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(2, 1fr);
  gap: 16px;
}

/* Центрируем последние два элемента */
.drawings-grid.five-items .drawing-item:nth-child(4) {
  grid-column: 1;
  grid-row: 2;
}

.drawings-grid.five-items .drawing-item:nth-child(5) {
  grid-column: 2;
  grid-row: 2;
}

/* Создаем псевдо-элемент для центрирования */
.drawings-grid.five-items::before {
  content: '';
  grid-column: 3;
  grid-row: 2;
  visibility: hidden;
}

.btn_spin{
  width: 100%;
  height: 100px;
  display: flex;
  justify-content: center;
  padding: 5px 0;
}
.btn_spin img{
  width: 90%;
  object-fit: contain;
}

</style>