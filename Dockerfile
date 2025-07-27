# Use Nginx Alpine for a lightweight static file server
FROM nginx:alpine

# Copy the HTML file to the nginx html directory
COPY index.html /usr/share/nginx/html/

# Copy nginx config template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Install gettext for envsubst (already available in nginx:alpine)
# Create a simple startup script
COPY <<EOF /start.sh
#!/bin/sh
echo "Starting with PORT: \${PORT:-80}"
envsubst '\$PORT' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
echo "Generated nginx config for port: \${PORT:-80}"
exec nginx -g 'daemon off;'
EOF

RUN chmod +x /start.sh

# Expose port 
EXPOSE 80

# Use our startup script
CMD ["/start.sh"]