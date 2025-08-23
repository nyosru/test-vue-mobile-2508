import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'

export default defineConfig({
    plugins: [vue()],

    // Явно указываем корневую директорию и index.html
    root: '.',
    publicDir: 'public',

    resolve: {
        alias: {
            '@': resolve(__dirname, './src')
        }
    },

    server: {
        host: '0.0.0.0',
        port: 5173,
        strictPort: true, // Не меняет порт если занят
        allowedHosts: true,  // ← разрешает все хосты
        watch: {
            usePolling: true
        }
    },

    build: {
        outDir: 'dist',
        rollupOptions: {
            input: {
                main: resolve(__dirname, 'index.html')
            }
        }
    }
})