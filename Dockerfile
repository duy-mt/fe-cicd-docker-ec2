#build stage
FROM node:16 as build-stage 
WORKDIR /app
COPY package*.json ./
RUN npm run start
COPY . .
RUN npm run build

#deploy stage
FROM nginx as deploy-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]