FROM node
RUN mkdir /app
WORKDIR /app
RUN pwd
RUN ls
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN curl -o image.jpeg https://storage.googleapis.com/test-express-app/image.jpeg
RUN mv image.jpeg public/images
CMD ["npm","start"]