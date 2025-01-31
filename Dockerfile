FROM golang:1.23-bookworm AS build

COPY ./ /go/src/github.com/softonic/hp-passthrough

RUN --mount=from=homing-pigeon,target=/go/src/github.com/softonic/homing-pigeon \
    cd /go/src/github.com/softonic/hp-passthrough && make build

RUN groupadd --gid 1000 app && useradd -u 1000 -g app app

FROM scratch

COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /etc/group /etc/group
COPY --chown=app:app --from=build /go/src/github.com/softonic/hp-passthrough/bin/hp-passthrough /

USER app

ENTRYPOINT ["/hp-passthrough", "-logtostderr"]
