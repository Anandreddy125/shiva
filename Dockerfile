# Stage 1: Build
FROM node:18.17.0-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --cache /path/to/larger/directory

# Copy the rest of the application code (including src/ folder)
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve
FROM node:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
