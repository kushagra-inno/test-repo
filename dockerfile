FROM node
RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN curl -o image.jpg https://en.wiktionary.org/wiki/File:Cat03.jpg
RUN cp image.jpg public/images
CMD ["npm","start"]