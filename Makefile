TAG ?= dev

dep:
	go mod download
build: dep
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags="-w -s" -o bin/hp-passthrough pkg/main.go
docker-build:
	docker buildx create --name hp-image-builder --driver docker-container --bootstrap 2> /dev/null || true
	docker buildx use hp-image-builder
	docker buildx build \
		--pull \
		--push \
		--build-context homing-pigeon=../homing-pigeon \
		-f ./Dockerfile \
		. \
		--platform linux/arm64,linux/amd64 \
		-t softonic/hp-pass-middleware:${TAG}
