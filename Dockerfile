FROM nginx:alpine

RUN apk add openssl && openssl req -new -newkey rsa:4096 -days 10000 -nodes -x509 \
    -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.crt \
    -subj "/C=VN/ST=North/L=Ha Noi/O=Localhost/CN=localhost"

COPY build /usr/share/nginx/html
COPY nginx /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]