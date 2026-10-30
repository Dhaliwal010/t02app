
# Stage 1: Build
FROM node:24 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Run
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
