# Use official Node.js image
FROM node:20

# Set working directory inside container
WORKDIR /app

# Copy package files first
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Build Strapi admin panel
RUN npm run build

# Expose Strapi port
EXPOSE 1337

# Start Strapi
CMD ["npm", "start"]

