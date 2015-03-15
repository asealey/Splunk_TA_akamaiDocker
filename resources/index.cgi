#!/usr/bin/python
import sys
with open("/syslog/remote/net/akamai/cis-akamai/akamai-post.log",'a') as f:
    f.write(sys.stdin.read())

print "Content-Type: text/plain;charset=utf-8"
print
