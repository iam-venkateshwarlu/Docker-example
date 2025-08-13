#Use a small base image
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Install only dependencies needed for build 
COPY package*.json ./
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Multi-stage: create a smaller runtime image
FROM node:18-alpine

# Security: avoid running as root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory in runtime image
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app /app/

# Add meaningful label
LABEL maintainer="tvenkateshwarlu39@gmail.com" \
      version="1.0" \
      environment="production"

# 10. Health check for container
HEALTHCHECK --interval=30s --timeout=5s \
  CMD wget -qO- http://localhost:3000/ || exit 1

  
# Expose the application port
EXPOSE 3000

# set entrypoint to run the application and default command
ENTRYPOINT [ "node", "index.js" ]