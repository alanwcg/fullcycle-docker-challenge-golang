FROM golang:alpine AS builder

WORKDIR /app

COPY app.go .

RUN go mod init github.com/alanwcg/fullcycle-docker-challenge-golang && \
    go build -ldflags "-s -w" app.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

ENTRYPOINT ["./app"]
