# set working directory
WORKDIR /app

# copy package files first
COPY app/package*.json ./

# install dependencies
RUN npm install

# copy the rest of the app
COPY app/ .

# expose port
EXPOSE 1337

# start Strapi
CMD ["npm", "start"]

