
IMAGE_NAME = couchbase-user

build:
	docker pull `grep "FROM .*" ./Dockerfile | cut -f2- -d " "` && docker build -t $(IMAGE_NAME) .

