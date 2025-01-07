// vite.config.js
export default defineConfig({
  plugins: [react()],
  build: {
    rollupOptions: {
      input: 'src/main.tsx', // Correct relative path
    },
  },
});
