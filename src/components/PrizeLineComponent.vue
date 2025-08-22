<template>
  <div class="flex-row">
    <div>
      <img src="/img/inf-history.png" alt="">
    </div>
    <div>
<!--      50 онлайн-->
      <img src="/img/inf-online.png" alt="" >
    </div>
    <div>
      <img src="/img/inf1.png" alt="" >
      <img src="/img/inf2.png" alt="" >
    </div>
  </div>
  <div class="row0">
    &nbsp;
  </div>
</template>

<script setup>
// Можно оставить пустым или добавить логику при необходимости
</script>

<style scoped>

.flex-row {
  display: flex;

  font-size: 14px;

  padding-left: 1px;
  padding-right: 1px;
}

.flex-row div {
  width: 33%;
}
.flex-row img{
  height: 35px;
}

.flex-row div:nth-child(2) {
  text-align: center;
}
.flex-row div:nth-child(2) img{
  height: 20px;
}
.flex-row div:nth-child(3) {
  text-align: right;
}
</style>
