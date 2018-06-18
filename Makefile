build: test
	go build -o ./bin/go_workshop ./cmd/go_workshop

test:
	go test -race ./...