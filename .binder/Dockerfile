FROM ipea/intro_access_book:latest

ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

RUN cp -r /renv/cache/v5 /renv/library

USER rstudio
