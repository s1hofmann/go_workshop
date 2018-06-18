PROJECT?=github.com/s1hofmann/go_workshop
BUILD_PATH?=./cmd/go_workshop

ifndef COMMIT
	COMMIT := git-$(shell git rev-parse --short HEAD)
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