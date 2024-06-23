FROM node:14-bullseye AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
FROM node:14-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["npm", "start"]
