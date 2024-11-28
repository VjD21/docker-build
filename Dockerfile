# Use Node.js 18 base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Install PM2 globally
RUN npm install -g pm2

# Verify PM2 installation by printing its version
RUN pm2 --version

# (Optional) Copy your application code
# COPY . .

# Expose the desired port (e.g., 3000)
EXPOSE 3000

# (Optional) Start your app with PM2
# CMD ["pm2-runtime", "start", "app.js"]

