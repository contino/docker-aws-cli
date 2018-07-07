# Docker AWS CLI
Containerised AWS CLI to ensure consistent local development and simple CD pipelines.

## Usage
Run as a command using `aws` as entrypoint:

    docker run --rm --entrypoint aws contino/aws-cli --version

Run as a shell and mount `.aws` folder and current directory as volumes:

    docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app contino/aws-cli bash

Using docker-compose:

    aws:
        image: contino/aws-cli
        env_file: .env
        entrypoint: aws
        working_dir: /opt/app
        volumes:
        - ~/.aws:/root/.aws
        - .:/opt/app:rw

And run `docker-compose run aws --version`

## Build 
Update the `AWS_CLI_VERSION` in both `Makefile` and `DockerFile`. The run:

    make build

Docker Hub will automatically triger a new build.

## Related Projects

- [docker-terraform](https://github.com/contino/docker-terraform)