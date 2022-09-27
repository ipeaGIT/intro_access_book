FROM rocker/binder:4.2.1

ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

ENV RENV_PATHS_CACHE=/tmp/renv/cache
RUN mkdir -p /tmp/renv/cache

RUN Rscript --vanilla -e "install.packages(\"renv\", repos = \"https://cloud.r-project.org/\")"
RUN Rscript -e "renv::restore()"

RUN --mount=type=bind,source=/tmp/renv/cache,target=/tmp/renv/cache Rscript -e "renv::restore()"
