FROM alpine
RUN apk add nodejs
RUN mkdir /app
WORKDIR /app
RUN wget https://yarnpkg.com/latest.tar.gz
RUN tar zvxf latest.tar.gz
COPY ./package.json ./
