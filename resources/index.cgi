#!/usr/bin/python
import sys
import urllib

with open("/syslog/remote/net/akamai/cis-akamai/akamai-post.log",'a') as f:
    for line in sys.stdin:
        f.write(urllib.unquote(urllib.unquote(line)).decode('utf8'))

print "Content-Type: text/plain;charset=utf-8"
print
