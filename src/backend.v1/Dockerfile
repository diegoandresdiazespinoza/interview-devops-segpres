FROM golang:1.12.14 AS base
COPY . ./app
WORKDIR "./app"
RUN apt update && apt upgrade -y
RUN go build -i -o ./bin/server
EXPOSE 8080
# This command starts up the app
ENTRYPOINT ["/go/app/bin/server"]
