# syntax = docker/dockerfile:1.2

FROM rocker/binder:4.4.1

ENV RENV_PATHS_ROOT=/renv
RUN Rscript --vanilla -e "install.packages(\"renv\", repos = \"https://cloud.r-project.org/\")"

COPY renv.lock ${HOME}

USER root
RUN Rscript -e "renv::restore()"
