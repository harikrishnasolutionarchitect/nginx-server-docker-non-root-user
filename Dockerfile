FROM nginx:1.25.2-alpine-slim
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /app
RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
USER nginx
EXPOSE 9080
CMD ["nginx", "-g", "daemon off;"]