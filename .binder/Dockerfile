FROM ipea/intro_access_book:latest

ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

RUN rm .Rprofile

USER rstudio
