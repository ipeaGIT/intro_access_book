FROM rocker/binder:4.2.1

ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

RUN Rscript -e --vanilla "install.packages(\"renv\")"
RUN Rscript -e --vanilla "renv::restore()"
