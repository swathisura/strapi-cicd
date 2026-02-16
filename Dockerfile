# set working directory
WORKDIR /app

# copy package.json and package-lock.json first
COPY app/package*.json ./

# install dependencies
RUN npm install

# copy the rest of the app
COPY app/ .

# expose port
EXPOSE 1337

# start strapi
CMD ["npm", "start"]
