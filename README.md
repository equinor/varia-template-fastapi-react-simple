## About this repository

This repository contains an application template for use with the [Varia developer portal](https://varia.equinor.com).
To use it, open [Varia](https://varia.equinor.com), hit the Create... menu and look for the template there.

Running the template creates a GitHub repository with the following content:
* A tiny frontend based on Typescript, Vite, React and EDS
* A tiny backend based on Python and FastAPI. The backend also hosts the frontend (single container)
* A Dockerfile for the app
* A radixconfig.yaml file for setting this up in Radix.

The actual setup in Radix is currently manual. Open [Radix](https://console.radix.equinor.com/applications), hit *Create new app* and follow the instructions.

The template is maintained by the Varia team, but any contributions are welcome.

## Prerequisites

* [uv](https://docs.astral.sh/uv/), the package manager used for the backend.
* [pnpm](https://pnpm.io/), the package manager used for the frontend.
* [Docker desktop](https://accessit.equinor.com/Search/Search?term=DOCKER+DESKTOP) - if you want to run in Docker.

## How to run locally

### Using Docker

```shell
$ docker build -t hello .
$ docker run -p 8000:8000 hello
```

### From the command line

#### Backend

The backend is set up to also host the frontend. To enable this, you need to build the frontend first,
and copy it to the backend for hosting:

```shell
$ cd web
$ pnpm install
$ pnpm build --outDir ../api/web
```

Then install dependencies and start the backend

```shell
$ cd api
$ uv sync
$ uv run main.py
```

#### Frontend

```shell
$ cd web
$ pnpm install
$ pnpm run dev
```