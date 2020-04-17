FROM node
RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
# RUN apt-get update
# RUN apt-get install curl -y
RUN curl -o image.jpg https://storage.googleapis.com/test-express-app/image.jpg
RUN mv image.jpg ./images
CMD ["npm","start"]