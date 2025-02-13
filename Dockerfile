# Use an official lightweight NGINX image
FROM nginx:alpine

# Remove the default website content
RUN rm -rf /usr/share/nginx/html/*

# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the landing page from the main folder to the root of the website
COPY main/ /usr/share/nginx/html/

# Copy the generated websites into the container
COPY generated/ /usr/share/nginx/html/generated/

# Optionally, if you need the templates or requirements for reference, you can copy them too
# COPY css_templates/ /usr/share/nginx/html/css_templates/
# COPY requirements/ /usr/share/nginx/html/requirements/

# Expose port 80
EXPOSE 8080

RUN chmod -R 755 /usr/share/nginx/html
