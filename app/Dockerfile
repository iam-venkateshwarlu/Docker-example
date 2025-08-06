FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker caching
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY app/. .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]