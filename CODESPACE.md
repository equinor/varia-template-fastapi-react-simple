# Welcome to your codespace

This codespace is a complete development environment running in the cloud. Python, [uv](https://docs.astral.sh/uv/), Node.js, [pnpm](https://pnpm.io/) and Docker are already installed, so you can start coding right away.

## What's in this repository

| Path | What it is |
| --- | --- |
| [web/](web/) | Frontend: TypeScript, React, [Vite](https://vite.dev/) and [EDS](https://eds.equinor.com/) |
| [api/](api/) | Backend: Python and [FastAPI](https://fastapi.tiangolo.com/). In production it also serves the built frontend |
| [Dockerfile](Dockerfile) | Builds the frontend and backend into a single container |
| [radixconfig.yaml](radixconfig.yaml) | Deploys the container to [Radix](https://www.radix.equinor.com/) |

### How the pieces fit together

- **During development**, two servers run side by side:
  - Vite serves the frontend on port 5173 and reloads it on every change.
  - Uvicorn runs FastAPI on port 8000.
  - Vite forwards requests to `/api/*` to the backend (see [web/vite.config.ts](web/vite.config.ts)).
- **In production**, the frontend is built into static files that FastAPI serves, so the app ships as a single container on port 8000.

## Get started

### 1. Run the app

Open the **Run and Debug** view (`Ctrl+Shift+D` / `Cmd+Shift+D`), select **Run**, then press `F5`.

This installs dependencies, builds the frontend, and starts both the backend and the frontend. Codespaces forwards the port and opens the app in your browser. You can set breakpoints in [api/main.py](api/main.py).

To stop, press `Shift+F5`.

### 2. Make a change

- **Frontend:** edit [web/src/App.tsx](web/src/App.tsx). The browser updates as soon as you save.
- **Backend:** edit [api/main.py](api/main.py), for example the `/api/hello` endpoint. The server restarts as soon as you save.

### 3. Test the container (optional)

Select **Run in Docker** in the Run and Debug view and press `F5`. This builds the image from the [Dockerfile](Dockerfile) and runs it exactly as Radix will.

### 4. Commit and push

Use the **Source Control** view (`Ctrl+Shift+G` / `Cmd+Shift+G`) to commit your changes and push them to GitHub.

### 5. Deploy to Radix

Deployment is automatic. Every push to the `main` branch makes [Radix](https://www.radix.equinor.com/) build the container and deploy it to the `dev` environment, as configured in [radixconfig.yaml](radixconfig.yaml). You can follow the build and find the app's URL in the Radix console.

If this repository was created from a Varia template, the Radix application and the GitHub webhook are already set up for you. Otherwise, follow the [Radix getting started guide](https://www.radix.equinor.com/start/) to register the app.

## Running from the terminal instead

```shell
# Backend
cd api && uv sync && uv run main.py

# Frontend (in a second terminal)
cd web && pnpm install && pnpm run dev
```

## Learn more

- [README.md](README.md): more details about this template
- [Varia developer portal](https://varia.equinor.com)
- [GitHub Codespaces documentation](https://docs.github.com/codespaces)
