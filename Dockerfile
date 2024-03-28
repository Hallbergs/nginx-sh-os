FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

RUN chgrp -R 0 /var/cache/nginx /var/run /var/log/nginx /var/run /etc/nginx/conf.d \
  && chmod -R g=u /var/cache/nginx /var/run /var/log/nginx /var/run /etc/nginx/conf.d

EXPOSE 8080

USER 1001

CMD ["nginx", "-g", "daemon off;"]