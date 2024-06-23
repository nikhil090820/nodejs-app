#Offical Node.js image as the base image
FROM node:14 AS build

#Set working directory inside the container
WORKDIR /app

#Copying the files i.e: package.json & package-lock.json to the working directory
COPY package*.json ./

#Install dependencies
RUN npm install

#Copy rest of the application code to the working directory
COPY . .

#Use smaller image for the build
FROM node:14-alpine

#Set working directory inside the container
WORKDIR /app

#Copy the build files and dependencies from the previous stage
COPY --from=build /app .

#Expose the port that app runs on
EXPOSE 3000

#command to run the application
CMD ["npm", "start"]
