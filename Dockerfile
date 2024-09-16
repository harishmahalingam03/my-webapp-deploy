# Use an official nginx image as the base
FROM ubuntu/apache2

# Copy static website files to the nginx html directory
RUN rm /var/www/html/index.html

COPY ./My-webapp /var/www/html/


# Expose port 80
EXPOSE 80
