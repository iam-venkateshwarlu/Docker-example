# Step 1: Use the official Node.js image as the base
FROM node:16

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Step 4: Install dependencies inside the container
RUN npm install

# Step 5: Copy the rest of the application files into the container
COPY . .

# Step 6: Expose the port that the application will listen on
EXPOSE 8000

# Step 7: Define the default command to run the app
CMD ["npm", "start", "0.0.0.0:8000"]

