FROM golang:1.13-buster AS build

COPY ./ /go/src/github.com/softonic/hp-passthrough

RUN cd /go/src/github.com/softonic/hp-passthrough && make build

FROM scratch

COPY --from=build /go/src/github.com/softonic/homing-pigeon/bin/hp-passthrough /

ENTRYPOINT ["/hp-passthrough"]