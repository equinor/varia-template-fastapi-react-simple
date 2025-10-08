This is a template repository for use with the [Varia developer portal](https://varia.equinor.com).
To use it, open [Varia](https://varia.equinor.com), press Create... and look for the template there.

Running the template creates a GitHub repository with the following content:
* A tiny backend based on Typescript, React and EDS
* A tiny backend based on Python and FastAPI. The backend also hosts the frontend (single container)
* A Dockerfile for the app
* A radixconfig.yaml file for setting this up in Radix.

The actual setup in Radix is currently manual. Open [Radix](https://console.radix.equinor.com/applications), hit *Create new app* and follow the instructions.

## Prerequisites

This app requires:
* Python 3.13 or later
* [uv](https://docs.astral.sh/uv/), the package manager for Python.

## Getting started

1. Create a Python virtual environment and activate it:

   ```
   $ cd api
   $ uv venv .venv
   $ source .venv/bin/activate
   ```

2. Build the frontend and publish to the backend:

   ```
   $ cd web
   $ pnpm build --outDir ../api/web
   ```

4. Run the app and follow the instructions on the screen:

   ```
   $ cd api
   $ uv run uvicorn
   ```
