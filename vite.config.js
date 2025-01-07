import path from 'path';
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'), // Resolve @ to src
    },
  },
  build: {
    rollupOptions: {
      input: path.resolve(__dirname, 'src/main.tsx'),  // Ensure correct path for entry file
    },
    chunkSizeWarningLimit: 5000,
    output: {
      manualChunks(id) {
        if (id.includes('node_modules')) {
          return id.toString().split('node_modules/')[1].split('/')[0];
        }
      },
    },
  },
  base: '/',  // Adjust if necessary for subdirectory
  server: {
    host: '0.0.0.0',
    port: 3000,
  },
});
