
IMAGE_NAME = couchbase-user:user1000

build:
	docker pull `grep "FROM .*" ./Dockerfile | cut -f2- -d " "` && docker build -t $(IMAGE_NAME) .

