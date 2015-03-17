# Splunk_TA_akamaiDocker
Docker container for a Splunk TA collecting logs from Akamai CloudMonitor

## Important configuration at runtime
* In order to use SSL, place the server.crt and server.key files in a volume
mapped to **/usr/local/apache2/conf/ssl**
* In order to get the logs out of the container, map an appropriate volume
(either host based or container link) to **/syslog/remote/net/akamai/cis-akamai**

## Example Usage
    docker run -d -p 80:80 -p 4443:443 -v /data/ssl/akamai:/usr/local/apache2/conf/ssl -v /data/syslog/cis-akamai:/syslog/remote/net/akamai/cis-akamai --name cis-akamai -h <hostname> asealey/splunkta_akamai
