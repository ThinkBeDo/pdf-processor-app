# Use Nginx Alpine for a lightweight static file server
FROM nginx:alpine

# Copy the HTML file to the nginx html directory
COPY index.html /usr/share/nginx/html/

# Copy nginx config template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Create startup script that substitutes environment variables and starts nginx
RUN echo '#!/bin/sh' > /docker-entrypoint.sh && \
    echo 'echo "PORT is set to: $PORT"' >> /docker-entrypoint.sh && \
    echo 'if [ -z "$PORT" ]; then' >> /docker-entrypoint.sh && \
    echo '  export PORT=80' >> /docker-entrypoint.sh && \
    echo 'fi' >> /docker-entrypoint.sh && \
    echo 'echo "Using PORT: $PORT"' >> /docker-entrypoint.sh && \
    echo 'envsubst "\$PORT" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf' >> /docker-entrypoint.sh && \
    echo 'echo "Generated nginx.conf:"' >> /docker-entrypoint.sh && \
    echo 'cat /etc/nginx/nginx.conf' >> /docker-entrypoint.sh && \
    echo 'exec nginx -g "daemon off;"' >> /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.sh

# Expose port (Railway will override this)
EXPOSE 80

# Start with our custom script
CMD ["/docker-entrypoint.sh"]