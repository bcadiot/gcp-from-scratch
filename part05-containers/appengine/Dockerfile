FROM httpd:2.4
# AppEngine listen on port 8080
RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
# Healthchecks are performed on a specific page
RUN mkdir -p /usr/local/apache2/htdocs/_ah && echo "healthy" > /usr/local/apache2/htdocs/_ah/health
EXPOSE 8080
