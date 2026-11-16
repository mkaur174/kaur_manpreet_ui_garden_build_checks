# Stage 1: Build the React application
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the production build using Nginx
FROM nginx:alpine
WORKDIR /kaur_manpreet_ui_garden_build_checks
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 8018
CMD ["nginx", "-g", "daemon off;"]