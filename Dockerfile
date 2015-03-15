# Dockerfile for Crits

FROM httpd:latest
MAINTAINER Adam Sealey <asealey@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

# Install Updates
RUN apt-get update && apt-get install -y \
  git \
  python

########## Setup Apache ###########


########## Setup Akamai Listener ###########
# Copy up the resources
ENV HTTPD_HTDOCS $HTTPD_PREFIX/htdocs

ADD resources/index.cgi $HTTPD_HTDOCS/
ADD resources/.htaccess $HTTPD_HTDOCS/
ADD resources/httpd.conf /usr/local/apache2/conf/
RUN rm -f $HTTPD_HTDOCS/index.html && \
  chgrp -R www-data $HTTPD_HTDOCS && \
  chmod +x $HTTPD_HTDOCS/index.cgi

# Setup the logging path
ENV AKAMAI_LOG_PATH /syslog/remote/net/akamai/cis-akamai/
RUN mkdir -p $AKAMAI_LOG_PATH && \
  chgrp -R www-data $AKAMAI_LOG_PATH


EXPOSE 80
EXPOSE 443


# Start up apache
#ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
