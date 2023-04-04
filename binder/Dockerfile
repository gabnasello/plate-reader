# https://hub.docker.com/gnasello/bose-compression/tags
ARG VERSION=2023-03-30
ARG BASE_CONTAINER=gnasello/datascience-env:$VERSION
FROM $BASE_CONTAINER

COPY --chown=${NB_UID}:${NB_GID} scripts "${HOME}"/