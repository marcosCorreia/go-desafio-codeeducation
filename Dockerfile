FROM golang:1.15 as builder
WORKDIR /go/src/code-education
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src/code-education
COPY --from=builder /go/src/code-education/code-education .

CMD ["./code-education"]