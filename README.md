This is a template repository for use with the [Varia developer portal](https://varia.equinor.com).
To use it, open [Varia](https://varia.equinor.com), press Create... and look for the template there.

Running the template creates a GitHub repository with the following content:
* A tiny backend based on Typescript, React and EDS
* A tiny backend based on Python and FastAPI. The backend also hosts the frontend (single container)
* A Dockerfile for the app
* A radixconfig.yaml file for setting this up in Radix.

The actual setup in Radix is currently manual. Open [Radix](https://console.radix.equinor.com/applications), hit *Create new app* and follow the instructions.

## How to run locally

```
$ docker build -t hello .
$ docker run -p 8000:8000 hello
```
