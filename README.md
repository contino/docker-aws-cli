# Docker AWS CLI
Containerised AWS CLI to ensure consistent local development and simple CD pipelines.

## Usage
Run as a command using default `aws` entrypoint:

    docker run --rm contino/aws-cli --version

Run as a shell by overwriting default entrypoint and mounting current directory:

    docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app --entrypoint bash contino/aws-cli

Using docker-compose:

    aws:
        image: contino/aws-cli
        env_file: .env
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