FROM ipea/intro_access_book:latest

ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

RUN Rscript -e "renv::isolate()"

USER rstudio
