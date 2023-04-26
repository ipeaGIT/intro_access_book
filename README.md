# Introduction to urban accessibility: a practical guide in R

[![Quarto build](https://github.com/ipeaGIT/aop_curso/actions/workflows/publish.yml/badge.svg)](https://github.com/ipeaGIT/aop_curso/actions)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ipeaGIT/intro_access_book/HEAD?urlpath=rstudio)

[*Clique aqui para ler a versão em português desta página*](./README.pt.md)

This book contains the source code used in the book [Introduction to urban accessibility: a practical guide in R](https://ipeagit.github.io/intro_access_book/), written by [Rafael H. M. Pereira](https://www.urbandemographics.org/) and [Daniel Herszenhut](https://dhersz.netlify.app/en/). If you use the material in this book, please cite it using the following reference:

> Pereira, Rafael H. M. & Herszenhut, Daniel. (2023) Introduction to urban accessibility: a practical guide with R. Ipea - Institute of Applied Economic Research.

**Note:** This is a live book, meaning that its content might change over time. However, the content has been mostly stable since early 2023, with small bug fixes and language revisions.

## Downloading the source code

The easiest way to get the book's source code is by cloning this repository with [git](https://git-scm.com/). After installing the software, you can clone the repo with the following command:

```
git clone https://github.com/ipeaGIT/intro_access_book.git
```

Alternatively, you can manually download the source-code with the following link: <https://github.com/ipeaGIT/intro_access_book/archive/refs/heads/main.zip>. If you decide to use this method, you also need to extract the `.zip` file content into a new directory.

## Reproducing the book in your computer

This book has been written with the [Quarto](https://quarto.org/) publishing system. Rendering `.qmd` files into HTML/PDF/etc requires the Quarto software. Please check the instructions on how to install it in [this link](https://quarto.org/docs/get-started/).

The book uses the [`{renv}`](https://rstudio.github.io/renv/index.html) R package to manage its dependencies. Using it ensures that the same R packages used by the authors when writing the book are going to be used when reproducing your local copy.

To download the dependencies, please open the book project. RStudio users should open the `intro_access_book.Rproj` file, located inside the directory that was created after downloading the source code. Other editors' users (neovim, VS Code, etc) should start an R session inside this directory. After opening the project, your console output will include messages that look similar to these:

```
# Bootstrapping renv 0.16.0 --------------------------------------------------
* Downloading renv 0.16.0 ... OK (downloaded binary)
* Installing renv 0.16.0 ... Done!
* Successfully installed and loaded renv 0.16.0.
* Project '~/repos/intro_access_book' loaded. [renv 0.16.0]
* The project library is out of sync with the lockfile.
* Use `renv::restore()` to install packages recorded in the lockfile.
```

After that, run the the following command to install the book dependencies:

```r
renv::restore()
```

Several packages are going to be listed and `{renv}` will ask you to confirm if you want to install them. After confirming it, the packages will be installed.

**Note:** This process may take a long time. Installing all packages, if you have never used `{renv}` before, might take anywhere from 5 to 30 minutes, depending on your computer's specification.

**Note 2:** This book depends on the `{sf}` package. If you are trying to reproduce the book in a Linux distribution, installing this package requires a few system dependencies. Please check the [instructions](https://github.com/r-spatial/sf#linux) on how to install `{sf}` to learn how to proceed in this case. The system dependencies must be installed **before** running the `renv::restore()` command.

After installing the book dependencies, you can normally execute its source code. The chapters are numerically ordered in `.qmd` files (english chapters also include a `en` suffix, ending with a `.en.qmd` extension). To render the entire book, use the following command *(please note that currently both the Portuguese and the English books are rendered)*:

```r
source("bilingual_render.R")
```

**Note:** Rendering the book might take a while. In our experience, the whole process might take from 5 to 15 minutes, depending on your computer's specifications.

**Note 2:** Rendering the book, in particular Chapter 6, requires around **4 GB of RAM**. Please make sure that your computer can handle this, otherwise the rendering process will probably result in an error and your computer will get very slow.

## Reproducing the book in a binder

A binder is a tool that allows you to interactively play with code in the cloud using a web browser. You can experiment with the book source code in a server published by [mybinder](https://mybinder.org/). To do this, click on the badge below: after a few moments, and RStudio Cloud session will start running in your browser. This session includes all the data and files required to run the book chapters.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ipeaGIT/intro_access_book/HEAD?urlpath=rstudio)

Please note that mybinder sessions are limited to 2 GB of RAM. This restriction might prevent some heavier chapters to be run, particularly Chapter 6. When using a binder, we recommend you not to render the entire book, as shown above.

## License

<img align="right" src="images/ipea_logo.png" width="240">
The material in this book may be reproduced and displayed for educational or informational purposes, provided credit is given to the original authors and the original work is cited. This book can be shared on websites and free and open online repositories only if it is made clear to users the terms of use of this material and who the copyright holder is, the Institute for Applied Economic Research (Ipea). Any commercial or for-profit use is prohibited. The creation of derivative works is prohibited. This license is based on studies about the Brazilian Copyright Law (Law 9.610/1998).

## Acknowledgements

This book was written under a partnership between the Institute for Applied Economic Research (Ipea) and the Secretariat of Mobility and Regional and Urban Development (SMDRU) of the Ministry of Regional Development (MDR) of the Brazilian federal government. The authors are grateful for the comments and suggestions from Lucas Mation. The authors would also like to thank the contributions of Anna Grigolon, Benjamin Büttner and Aaron Nichols for proofreading the English version of the book. Any remaining errors are the sole responsibility of the authors.
