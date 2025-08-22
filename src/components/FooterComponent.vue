<template>
  <div class="stats-row">
    <div v-for="(item, index) in items" :key="index" class="stat-item">
      <div class="stat-content">
        <img :src="item.icon" :alt="item.label" class="stat-icon">
        <span class="stat-label">{{ item.label }}</span>
<!--        <span class="stat-value">{{item.value }}</span>-->
      </div>
    </div>
  </div>
</template>

<script setup>
const items = [
  { icon: '/img/btn-down-1.svg', label: 'Мои подарки', value: '100' },
  { icon: '/img/btn-down-2.svg', label: 'Главная', value: '500' },
  { icon: '/img/btn-down-3.svg', label: 'Профиль', value: '1000' }
]
</script>

<style scoped>
.stats-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
  padding: 16px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 12px;
}

.stat-item {
  flex: 1;
  display: flex;
  justify-content: center;
}

.stat-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  text-align: center;
}

.stat-icon {
  width: 50px;
  height: 50px;
  object-fit: contain;
}

.stat-label {
  color: #ccc;
  font-size: 14px;
  font-weight: 500;
}

.stat-value {
  color: #fff;
  font-size: 18px;
  font-weight: bold;
}

/* Адаптивность */
@media (max-width: 480px) {
  .stats-row {
    gap: 12px;
    padding: 12px;
  }

  .stat-icon {
    width: 40px;
    height: 40px;
  }

  .stat-label {
    font-size: 12px;
  }

  .stat-value {
    font-size: 16px;
  }
}
</style>