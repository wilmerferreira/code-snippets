# Docker

## Dockerfile

### Commands

#### [FROM](https://docs.docker.com/engine/reference/builder/#from)

Set the base image for building a new image.

> This command must be on top of the dockerfile

#### [RUN](https://docs.docker.com/engine/reference/builder/#run)

Used to execute a command during the build process of the docker image.

#### [CMD](https://docs.docker.com/engine/reference/builder/#cmd)

Used for executing commands when we build a new container from the docker image.

#### [LABEL](https://docs.docker.com/engine/reference/builder/#label)

Adds metadata to an image.

#### [MAINTAINER](https://docs.docker.com/engine/reference/builder/#maintainer-deprecated) **(deprecated)**

Allows you to set the Author field of the generated images.

#### [EXPOSE](https://docs.docker.com/engine/reference/builder/#expose)

Informs Docker that the container listens on the specified network port(s) at runtime

#### [ENV](https://docs.docker.com/engine/reference/builder/#env)

Define an environment variable.

#### [ADD](https://docs.docker.com/engine/reference/builder/#add)

Copy a file from the host machine to the new docker image. There is an option to use an URL for the file, docker will then download that file to the destination directory.

#### [COPY](https://docs.docker.com/engine/reference/builder/#copy)

Copies new files or directories and adds them to the filesystem of the container.

#### [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint)

Define the default command that will be executed when the container is running.

#### [VOLUME](https://docs.docker.com/engine/reference/builder/#volume)

Enable access/linked directory between the container and the host machine.

#### [USER](https://docs.docker.com/engine/reference/builder/#user)

Set the user or UID for the container created with the image.

#### [WORKDIR](https://docs.docker.com/engine/reference/builder/#workdir)

This is directive for CMD command to be executed.

#### [ARG](https://docs.docker.com/engine/reference/builder/#arg)

Defines a variable that users can pass at build-time to the builder.

#### [ONBUILD](https://docs.docker.com/engine/reference/builder/#onbuild)

Adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build.

#### [STOPSIGNAL](https://docs.docker.com/engine/reference/builder/#stopsignal)

Sets the system call signal that will be sent to the container to exit.

#### [HEALTHCHECK](https://docs.docker.com/engine/reference/builder/#healthcheck)

Tells Docker how to test a container to check that it is still working.

#### [SHELL](https://docs.docker.com/engine/reference/builder/#shell)

Allows default shell used for the shell form of commands to be overridden. The default shell on Linux is `bash`, and on Windows is `cmd`.

### References

- [Reference](https://docs.docker.com/engine/reference/builder/)
- [Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
