# Build Stage
FROM node:latest AS build-stage
WORKDIR /app
RUN git clone ${repo} .
RUN npm install
RUN npm run build

# Production Stage
FROM nginx:latest
COPY --from=build-stage /app/build /usr/share/nginx/html