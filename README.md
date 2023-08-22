# docker-diceware

[![Docker](https://github.com/chorrell/docker-diceware/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/chorrell/docker-diceware/actions/workflows/docker-publish.yml)

A docker image for [diceware](https://github.com/ulif/diceware)

## Usage with Docker run

Use this Docker image from the command line in the same way you would with [diceware](https://github.com/ulif/diceware).

First build the image:

```sh
docker build -t diceware .
```

Now use the image to call diceware with `docker run -it --rm diceware`:

Run diceware without arguments to generate a password:

```sh
docker run -it --rm diceware
```

View the usage:

```sh
docker run -it --rm diceware --help
```

Get the version info:

```sh
docker run -it --rm diceware --version
```

Generate a password with 4 words (`-n 4`) using '-' as a delimiter (`-d-`) and replace 2 normal letters with a special character (-s 2):

```sh
docker run -it --rm diceware -n 4 -d- -s 2
```

## Make it easier with an alias

Add this to your `.bashrc` or `.zshrc` file:

```bash
alias diceware='docker run -i --rm diceware'
```

## Even better, use the Docker Hub image

This image is published to the Docker Hub. You can use it like this:

```sh
docker pull chorrell/diceware:latest

docker run -i --rm chorrell/diceware:latest
```

And setup an alias like this:

```bash
alias diceware='docker run -i --rm chorrell/diceware:latest'
```

## Using the GitHub Container Registry image

The lateset version of this image is also published to the GitHub Container Registry. You can use it like this:

```sh
docker pull ghcr.io/chorrell/diceware:latest

docker run -i --rm ghcr.io/chorrell/diceware:latest
```

And setup an alias like this:

```bash
alias diceware='docker run -i --rm ghcr.io/chorrell/diceware:latest'
```
