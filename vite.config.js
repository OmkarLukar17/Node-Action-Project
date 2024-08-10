import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0', // Allows the server to be accessible externally
    port: 5173,      // Default port for Vite
  },
})
