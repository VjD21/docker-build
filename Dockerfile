# First stage: Node.js base image with PM2 installed
FROM node:18 AS pm2

# Set the working directory inside the container
WORKDIR /app

# Install PM2 globally
RUN npm install -g pm2

# Verify PM2 installation by printing its version
RUN pm2 --version

# Second stage: NGINX base image
FROM nginx:latest

# Copy Node.js binaries and PM2 from the first stage
COPY --from=pm2 /usr/local/lib /usr/local/lib
COPY --from=pm2 /usr/local/bin /usr/local/bin
COPY --from=pm2 /usr/lib /usr/lib

# Verify PM2 installation
RUN pm2 --version

# Set working directory
WORKDIR /app

# Expose port 9000 for NGINX
EXPOSE 9000

