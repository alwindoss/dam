GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_LOC=bin
BINARY_NAME=dam
DOCKER_REPOSITORY_OWNER=alwindoss
VERSION=0.0.1

all: build
docker:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o ./$(BINARY_LOC)/$(BINARY_NAME) -v 
package:
	docker build -t $(DOCKER_REPOSITORY_OWNER)/$(BINARY_NAME):$(VERSION) .
publish:
	docker push $(DOCKER_REPOSITORY_OWNER)/$(BINARY_NAME):$(VERSION)
setup:
	$(GOGET) -v ./...
build:
	$(GOBUILD) -o ./$(BINARY_LOC)/$(BINARY_NAME) -v 
test: 
	$(GOTEST) -v ./...
clean: 
	$(GOCLEAN)
	rm -rf $(BINARY_LOC)
run: clean build
	./$(BINARY_LOC)/$(BINARY_NAME)
