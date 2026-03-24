FROM alpine:latest AS build

RUN apk add --no-cache git build-base linux-headers

RUN cd / && git clone https://github.com/brauner/move-mount-beneath.git && \
    cd move-mount-beneath && gcc -static move-mount.c -o move-mount && mv move-mount /move-mount

FROM alpine:latest AS target

COPY --from=build /move-mount /app/move-mount
COPY repo /app/repo
COPY repo.conf /app/repo.conf
COPY list.pkgs /app/list.pkgs
COPY init /app/init
COPY scripts /app/scripts
