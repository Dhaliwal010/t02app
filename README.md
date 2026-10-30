
# Project 2 - Containerize and Run Locally

## Project Overview

This project uses Docker to run a simple website,
Docker Compose to manage Nginx and Redis,
and AWS SAM to run a local function.

## Requirements

- Docker Engine
- Docker Compose
- AWS SAM CLI

## Build the Docker Images

Run these commands from the project folder:

    docker build -t demo:multi .
    docker build -f Dockerfile.single -t demo:single .
    docker images

## Start the Containers

    docker compose up -d
    docker compose ps

## Test Redis

    docker compose exec cache redis-cli ping

Expected result: PONG

## Test the Website

    curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8080

Expected result: 200

Open http://localhost:8080 in a browser.

## Check Container Logs

    docker compose logs web

## Inspect Container

    docker compose exec web sh -c 'nginx -v'

## Test Local Function

From the project folder:

    cd local-fn
    sam local invoke HelloWorldFunction
    sam local invoke HelloWorldFunction -e events/event.json
    cd ..

Expected response includes statusCode 200.

## Stop Containers

    docker compose down
