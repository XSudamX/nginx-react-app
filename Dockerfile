# Build Stage
FROM node:latest AS build-stage
ARG repoarg
ENV repo=$repoarg
WORKDIR /app
RUN git clone ${repo} .
RUN npm install && npm run build

# Production Stage
FROM nginx:latest
COPY --from=build-stage /app/build /usr/share/nginx/html