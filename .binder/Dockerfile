FROM ipea/intro_access_book:latest

USER root

ARG NB_USER
ARG NB_UID

RUN mv ./renv/library ./library

COPY --chown=${NB_USER} . ${HOME}

RUN mv ./library ./renv/library
