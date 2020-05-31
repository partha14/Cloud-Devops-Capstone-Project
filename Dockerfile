  
FROM nginx:mainline-alpine
ADD index.html /usr/share/nginx/html/
EXPOSE 80
