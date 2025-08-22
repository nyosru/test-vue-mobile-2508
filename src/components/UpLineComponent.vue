<template>
  <div class="container">
    <div class="scroll-container">
      <div v-for="n in 10" :key="n" class="cell">
        <div>
        верх линия
      <br/>
        инфа: {{ n }}
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
// Можно оставить пустым или добавить логику при необходимости
</script>

<style scoped>

.container {
  width: 100%;
  height: 7vh;
  overflow: hidden; /* чтобы не было лишних полос прокрутки */
  padding: 0;
  margin-top: 10px;
}

.scroll-container {
  display: flex;

  height: 100%;
  overflow-x: auto; /* включаем горизонтальный скролл */

  /* Скрываем скролл */
  scrollbar-width: thin;
  scrollbar-color: transparent transparent;
}

.scroll-container::-webkit-scrollbar {
  width: 0;
  height: 0;
}

.cell {
  width: 150px;
  height: 100%;

  border-radius: 5px;
  margin-right: 8px; /* отступ между ячейками */
}

.cell div{
  display: flex;
  align-items: center;
  justify-content: center;

  font-size: 14px;

  padding-left: 1px;
  padding-right: 1px;

  background-color: rgba(0,0,0,0.9);
  border-radius: 10px;

  width: 150px;
  height: 100%;
}

</style>