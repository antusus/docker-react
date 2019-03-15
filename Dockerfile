FROM node:lts-alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.15-alpine
COPY --from=builder /usr/app/build /usr/share/nginx/html