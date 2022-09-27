FROM rocker/binder:4.2.1

ARG NB_USER
ARG NB_UID

ENV RENV_PATHS_CACHE=renv/cache

RUN mkdir -p $RENV_PATHS_CACHE

COPY --chown=${NB_USER} renv/cache ${RENV_PATHS_CACHE}

COPY --chown=${NB_USER} . ${HOME}

RUN Rscript --vanilla -e "install.packages(\"renv\", repos = \"https://cloud.r-project.org/\")"
RUN Rscript -e "renv::restore()"
