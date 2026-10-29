FROM mcr.microsoft.com/devcontainers/python:1-3.13-bookworm

# The base image ships a Yarn apt repo whose signing key has expired, which breaks apt-get in features.
RUN rm -f /etc/apt/sources.list.d/yarn.list
