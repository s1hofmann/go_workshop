PROJECT?=github.com/s1hofmann/go_workshop
BUILD_PATH?=./cmd/go_workshop

ifndef COMMIT
	COMMIT := $(shell git rev-parse --short HEAD)
endif

ifndef BUILD_TIME
	BUILD_TIME := $(shell date +%Y%m%d%H%M%S)
endif

RELEASE?=0.0.1

build: test
	go build \
		-ldflags "-s -w \
		-X ${PROJECT}/internal/version.Release=${RELEASE} \
		-X ${PROJECT}/internal/version.Commit=${COMMIT} \
		-X ${PROJECT}/internal/version.BuildTime=${BUILD_TIME}" \
		-o ./bin/go_workshop ${PROJECT}/${BUILD_PATH}

test:
	go test -race ./...