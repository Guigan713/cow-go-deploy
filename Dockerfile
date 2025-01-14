FROM golang:1.24rc1-bookworm

RUN apt update

COPY main* main

WORKDIR /go

ENTRYPOINT ["./main"]




