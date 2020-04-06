# SRT Docker Image

![https://hub.docker.com/r/miyukki/srt](https://dockeri.co/image/miyukki/srt)

Lightweight [Haivision/srt](https://github.com/Haivision/srt) docker image based on ubuntu.

Inside this container, you can execute the following binaries provided by the Haivision/srt:
`srt-live-transmit`, `srt-file-transmit`, `srt-tunnel`, etc.

## How to use

Run docker container using prebuilt image `miyukki/srt`.

```sh
docker run -it --rm miyukki/srt:latest srt-live-transmit udp://127.0.0.1:5000 srt://:60000
```

## How to build

Run make command with args.

```sh
DOCKER_TAG=v1.4.1 SRT_BRANCH=v1.4.1 make build
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[miyukki](https://github.com/miyukki)