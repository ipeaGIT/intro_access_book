FROM rocker/binder:4.2.1

ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} ~/.local/share/renv ${HOME}/share/renv

COPY --chown=${NB_USER} . ${HOME}

RUN Rscript --vanilla -e "install.packages(\"renv\", repos = \"https://cloud.r-project.org/\")"
RUN Rscript -e "renv::restore()"
