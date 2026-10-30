# Project 2 — Technical Rationale

## Base Image Selection

For this project, I used `node:24` as the build-stage image and `nginx:alpine` as the final-stage image.

Node.js provides the tools required to build the application. Nginx serves the completed website without requiring Node.js in the final container.

I chose a multi-stage Dockerfile because it separates development tools from the final application. This reduces image size and avoids including unnecessary software.

I compared both images using the `docker images` command:

- Multi-stage image: **93.6 MB**
- Single-stage image: **1.65 GB**

The multi-stage image was approximately **94% smaller** based on Docker's reported disk usage.

## Service Separation

I used Docker Compose to run two services: `web` and `cache`.

The `web` service uses Nginx to display the website. The `cache` service uses the public `redis:7-alpine` image.

Keeping Redis separate allows the services to be managed independently. Docker Compose uses `depends_on` and a healthcheck to ensure Redis is healthy before starting the web service.

Containers provide a balance between IaaS and PaaS because developers control individual services while using prebuilt dependencies instead of developing everything from scratch.

In this project, Redis demonstrates startup dependency management. The static website does not actively use Redis during requests.

## References

1. Docker. *Multi-stage builds*. https://docs.docker.com/build/building/multi-stage/
2. Docker. *Control startup and shutdown order in Compose*. https://docs.docker.com/compose/how-tos/startup-order/
3. Docker. *Docker Compose configuration reference*. https://docs.docker.com/reference/cli/docker/compose/config/