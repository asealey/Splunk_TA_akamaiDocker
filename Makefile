NAME = asealey/splunkta_akamai
HOSTNAME = cis-akamai.nike.com
VERSION = 0.1

.PHONY: all build tag_latest

all: build

build:
	docker build -t $(NAME):$(VERSION) .

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest
