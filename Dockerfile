# 1. Use Node Alpine
FROM node:20-alpine

# 2. Install build tools
RUN apk add --no-cache python3 make g++

# 3. Set working directory
WORKDIR /app

# 4. Copy package.json and package-lock.json into /app
COPY app/package*.json ./

# 5. Install dependencies
RUN npm install

# 6. Copy the rest of the app
COPY app/ ./

# 7. Build Strapi
RUN npm run build

# 8. Expose port
EXPOSE 1337

# 9. Start Strapi
CMD ["npm", "start"]


