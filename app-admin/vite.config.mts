/* eslint-disable import/no-extraneous-dependencies */

import react from '@vitejs/plugin-react-swc';
import { defineConfig } from 'vite';
import svgr from 'vite-plugin-svgr';

import path from 'path';

// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    preserveSymlinks: true,
  },
  plugins: [react(), svgr()],
  server: {
    host: 'localhost',
    port: 3000,
  },
});
