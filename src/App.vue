<template>
  <div class="mobile-app">

    <header>
      <UpLineComponent />
    </header>

    <div class="row1">
      <PrizeLineComponent />
    </div>

    <div class="row9">
      <GoPlayComponent />
<!--      <TypeSelect-->
<!--          v-model="selectedType"-->
<!--          :options="[-->
<!--        { label: 'Тип 1', value: 1 },-->
<!--        { label: 'Тип 2', value: 2 },-->
<!--        { label: 'Тип 3', value: 3 }-->
<!--      ]"-->
<!--      />-->
      <!--      БзЮВыбран: {{ selectedType }}</p>-->
          </div>


          <footer>

            <FooterComponent />
<!--            <div class="flex flex-row">-->
<!--              <div class="flex-1">-->
<!--                иконка-->
<!--                <br/>-->
<!--                ссылка-->
<!--              </div>-->
<!--              <div class="flex-1">-->
<!--                иконка-->
<!--                <br/>-->
<!--                ссылка-->
<!--              </div>-->
<!--              <div class="flex-1">-->
<!--                иконка-->
<!--                <br/>-->
<!--                ссылка-->
<!--              </div>-->
<!--            </div>-->

          </footer>

        </div>
      </template>

      <script setup>

      import {ref, computed} from 'vue'

      const activeCount = ref(1)
      const drawings = ref([])


      // ⬇️ Импортируем наш компонент
      import TypeSelect from './components/TypeSelect.vue';
      // ✅ Управление выбранным значением
      const selectedType = ref(1);

      import DrawingsSelector from './components/DrawingsSelector.vue';
      import UpLineComponent from './components/UpLineComponent.vue';
      import PrizeLineComponent from './components/PrizeLineComponent.vue';
      import GoPlayComponent from './components/GoPlayComponent.vue';
      import FooterComponent from './components/FooterComponent.vue';

      </script>





      <style scoped>

      header {
        height: 10vh;
        xoverflow-x: auto;
        xborder: 1px solid red;
      }














      /* Тёмно-серый фон у всей строки */
      .buttons-panel {
        background-color: #333; /* тёмно-серый фон */
        display: flex;
        gap: 8px;
        padding: 8px;
        border-radius: 6px;
      }

      /* Общие стили для кнопок */
      .number-button {
        border: 2px solid #999; /* серая граница для неактивных */
        background-color: transparent;
        color: white;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
        transition: border-color 0.3s ease;
      }

      /* Стиль для активной кнопки */
      .number-button.active {
        border-color: #007bff; /* синяя граница */
      }


      .mobile-app {
        color: white;
        height: 100vh;
        xbackground-color: #000;
        background-color: #1e1e1e;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        overflow: hidden;
      }


      /* Светлый круг сверху */
      .mobile-app::before {
        content: '';
        position: absolute;
        top: -35vh;
        left: 50%;
        transform: translateX(-50%);
        width: 150vw;
        height: 50vh;
        background: radial-gradient(
            circle at center,
            rgba(61, 136, 168, 0.6) 5%,
            rgba(61, 136, 168, 0.01) 50%,
            rgba(61, 136, 168, 0) 90%,
            transparent 50%
        );
        pointer-events: none;
        z-index: 1;
      }

      /* Светлый круг снизу */
      .mobile-app::after {
        content: '';
        position: absolute;
        bottom: -25vh;
        left: 50%;
        transform: translateX(-50%);
        width: 100vw;
        height: 50vh;
        background: radial-gradient(
            circle at center,
            rgba(61, 136, 168, 0.15) 0%,
            rgba(61, 136, 168, 0.1) 25%,
            rgba(61, 136, 168, 0.05) 50%,
            transparent 70%
        );
        pointer-events: none;
        z-index: 1;
      }

      .mobile-app .row1 {
        height: 35vh;

        xborder: 2px solid orange;

        background-image: url('/img/przes.png');

        background-size: auto 80%; /* Масштабирование изображения */
        background-position: center bottom; /* Центрирование изображения */
        background-repeat: no-repeat; /* Отключение повторения */

      }

      .mobile-app .row9 {
        height: 55vh;
        xborder: 2px solid orange;

      }

      .mobile-app .row10 {
        height: 10vh;
        border: 2px solid green;
        padding: 3px 5px;
      }

      footer {
        height: 10vh;
        border-top: 1px solid white;
        border-radius: 10px 10px 0 0;
        padding: 3px 5px;

      }

      .flex {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
      }


      .run_button {
        border-radius: 20px;
        overflow: hidden;
        background-color: #667eea;
        font-size: 3rem;
        text-align: center;
        width: 100%;
        background-image: url('/img/but1.png'); /* Установка изображения как фона */
        background-size: cover; /* Масштабирование изображения */
        background-position: center; /* Центрирование изображения */
        background-repeat: no-repeat; /* Отключение повторения */
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