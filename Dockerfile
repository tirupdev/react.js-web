# Base image
FROM node:16

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy application source
COPY . .

# Build the app
RUN npm run build

# Serve the app with a simple HTTP server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose port
EXPOSE 5000
