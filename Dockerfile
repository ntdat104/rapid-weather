FROM node:17-alpine as Builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:latest
COPY --from=Builder /app/build /usr/share/nginx/html