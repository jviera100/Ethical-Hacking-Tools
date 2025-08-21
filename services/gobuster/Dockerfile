FROM golang:alpine as builder

WORKDIR /src
RUN apk add --no-cache git
RUN git clone https://github.com/OJ/gobuster.git .
RUN go mod init github.com/OJ/gobuster
RUN go mod tidy
RUN go build -o /usr/local/bin/gobuster .

FROM alpine:latest
COPY --from=builder /usr/local/bin/gobuster /usr/local/bin/gobuster
ENTRYPOINT ["gobuster"]
CMD ["--help"]