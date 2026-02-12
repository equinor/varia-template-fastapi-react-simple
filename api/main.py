from contextlib import asynccontextmanager
import os
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
import uvicorn


@asynccontextmanager
async def lifespan(app: FastAPI):
    static_folder = "/web" if os.path.isdir("/web") else "./web"
    app.mount("/", StaticFiles(directory=static_folder, html=True), name="web")
    app.mount("/assets", StaticFiles(directory=static_folder + "/assets"), name="assets")
    yield

app = FastAPI(lifespan=lifespan)

@app.get("/api/hello")
async def root():
    return {"message": "Hello World!"}


if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
