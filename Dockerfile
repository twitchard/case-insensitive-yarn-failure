FROM alpine
RUN apk add nodejs
RUN wget https://yarnpkg.com/latest.tar.gz
RUN tar zvxf latest.tar.gz
RUN mkdir /app
WORKDIR /app
