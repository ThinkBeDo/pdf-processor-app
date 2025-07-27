# Use Nginx Alpine for a lightweight static file server
FROM nginx:alpine

# Install envsubst utility (already included in nginx:alpine)
# Copy the HTML file to the nginx html directory
COPY index.html /usr/share/nginx/html/

# Copy nginx config template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Expose the port that Railway will assign
EXPOSE $PORT

# Create startup script that substitutes environment variables
RUN echo '#!/bin/sh' > /docker-entrypoint.sh && \
    echo 'envsubst "\$PORT" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf' >> /docker-entrypoint.sh && \
    echo 'exec nginx -g "daemon off;"' >> /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.sh

# Start with our custom script
CMD ["/docker-entrypoint.sh"]