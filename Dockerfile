FROM nginx:latest

WORKDIR /template

COPY . .

RUN rm /usr/share/nginx/html/index.html \
    && cp -r /template/ /usr/share/nginx/html
    
Expose 80/tcp    
