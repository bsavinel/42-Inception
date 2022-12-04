FROM alpine:3.14

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN adduser -D -g 'www' www
EXPOSE 443
COPY ./nginx.conf /nginx.conf
COPY ./index.html /index.html
CMD ["nginx" "-c" "/nginx.conf" "-g" "daemon off;"]