FROM node
RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN curl -o image.jpg https://storage.googleapis.com/test-express-app/image.jpeg
RUN cp image.jpg public/images
CMD ["npm","start"]