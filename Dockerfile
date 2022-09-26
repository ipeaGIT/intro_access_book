FROM rocker/binder:4.2.1

RUN Rscript -e "install.packages(\"renv\"); renv::restore()"
