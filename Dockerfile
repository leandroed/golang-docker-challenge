FROM golang:1.12.0-alpine3.9 AS builder
WORKDIR /app
COPY . /app
RUN go build -o ./dist/main

FROM scratch
WORKDIR /
COPY --from=builder /app/dist/main /main
ENTRYPOINT ["/main"]