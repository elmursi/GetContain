# Use official Nginx image
FROM nginx:latest

# Create necessary directories with correct permissions
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R 1000:1000 /var/cache/nginx

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Change working directory ownership
USER 1000

# Expose non-privileged port
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
