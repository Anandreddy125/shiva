# Build stage
FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Production stage
FROM nginx:latest
COPY --from=build /app/dist /usr/share/nginx/html
