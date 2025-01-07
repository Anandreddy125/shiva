# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Pass the mode argument to Vite's build process
ARG MODE=docker-prod
RUN npm run build:${MODE}

# Stage 2: Serve with Nginx
FROM nginx:1.25.4-alpine-slim AS prod
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf  /etc/nginx/conf.d
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
