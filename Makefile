PROJECT?=github.com/s1hofmann/go_workshop
BUILD_PATH?=./cmd/go_workshop
APP?=go_workshop

GOOS?=linux
GOARCH?=amd64

REGISTRY?=docker.io/s1hofmann
NAMESPACE=s1hofmann
CONTAINER_NAME?=${NAMESPACE}-${APP}
CONTAINER_IMAGE?=${REGISTRY}/${CONTAINER_NAME}

ifndef COMMIT
	COMMIT := $(shell git rev-parse --short HEAD)
endif

ifndef BUILD_TIME
	BUILD_TIME := $(shell date +%Y%m%d%H%M%S)
endif

RELEASE?=0.0.1

clean:
	rm -f ./bin/${GOOS}-${GOARCH}/${APP}

build: test
	CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} go build \
		-ldflags "-s -w \
		-X ${PROJECT}/internal/version.Release=${RELEASE} \
		-X ${PROJECT}/internal/version.Commit=${COMMIT} \
		-X ${PROJECT}/internal/version.BuildTime=${BUILD_TIME}" \
		-o ./bin/${GOOS}-${GOARCH}/${APP} ${PROJECT}/${BUILD_PATH}

image: build
	docker build -t $(CONTAINER_IMAGE):$(RELEASE) .

run: image
	docker run --name ${CONTAINER_NAME} -p ${PORT}:${PORT} -e PORT=${PORT} -p ${DIAGNOSTICS_PORT}:${DIAGNOSTICS_PORT} -e DIAGNOSTICS_PORT=${DIAGNOSTICS_PORT} -d $(CONTAINER_IMAGE):$(RELEASE)

test:
	go test -race ./...