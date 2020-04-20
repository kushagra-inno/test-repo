FROM node
RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN curl -o public/images/image.jpeg https://storage.googleapis.com/test-express-app/image.jpeg
CMD ["npm","start"]