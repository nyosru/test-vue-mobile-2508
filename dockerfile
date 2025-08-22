# Базовый образ для сборки
FROM dockerhub.timeweb.cloud/library/node:18-alpine as development

WORKDIR /app

# Копируем ВСЕ файлы включая index.html
COPY package*.json ./
COPY index.html ./
COPY vite.config.js ./
COPY tailwind.config.js ./

RUN npm install

# Копируем исходный код
COPY src/ ./src/
# если есть public директория
COPY public/ ./public/

# Билд стадия
FROM dockerhub.timeweb.cloud/library/node:18-alpine as build-stage

WORKDIR /app

COPY --from=development /app/node_modules ./node_modules
COPY --from=development /app/package*.json ./
COPY --from=development /app ./

RUN npm run build

# Production стадия
FROM dockerhub.timeweb.cloud/library/nginx:alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]