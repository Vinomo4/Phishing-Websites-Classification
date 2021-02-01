# Phishing-Websites-Classification
>  Kernel methods used to distinguish between phishing and secure websites.

The aim of this project is to develop ad-hoc kernels that take into account the categorical nature of the variables,and that exploit the nuances and relationships they present, that ease recognizing if a website is secure or malignant.

The number of kernels designed throughout the project is extensive and very diverse, ranging from addaptations of traditional kernels, like *RBF*, to more complex and subject-oriented kernel formulas.

<p align="center">
  <img src='README Images/warning.png'/ width = 500>
</p>

## Used techniques

To solve the classification problem, several kernel functions have been used, as well as non-kernel methods in order to compare performances:

### Non-kernel methods
* Naive Bayes
* Random Forest
### Kernel mehtods
* Overlap
* Simple Matching Coefficient (SMC)
* Multivariate
* Multivariate ID (Using **I** as link function)
* Multivariate centered

And 9 additional methods based on the Gower Legendre similarities:
* GL 3
* GL 4
* GL 5
* GL 6
* GL 7
* GL 9
* GL 12
* GL 13
* GL 14

<p align="center">
  <img src='README Images/methods.PNG'/>
</p>

## Installation

In order to correctly use the programs provided, it is necessary to have installed the following libraries:

* `library(naivebayes)`
* `library(MASS)`
* `library(klaR)`
* `library(nnet)`
* `library(caret)`
* `library(randomForest)`
* `library(ggplot2)`
* `library(kernlab)`
* `library(reshape)`

To install the requested libraries, the following command should be executed in the [R Studio®](https://rstudio.com/) console:

`install.packages("name_of_package")`

## Architecture

The files contained on this repository are:

* [`R Code`](./Code.Rmd) with all the hyperparameters tunning and CV for each one of the used techniques.
* [`Kernel file`](./Kernels.R) containg all kernel functions used by the *kernlab* library.
* The [`Dataset`](./Data.csv) used in this project.
* An extensive [`report`](./Report.pdf) about the development of the kernels, they perfomance and the conclusions of this project. 

*Note: The rest of the files in the master branch are auxiliary or license related*

## Team

This project was developed by:
| [![Vinomo4](https://avatars2.githubusercontent.com/u/49389601?s=60&v=4)](https://github.com/Vinomo4) | [![CarlOwOs](https://avatars3.githubusercontent.com/u/49389491?s=60&u=b239b67c3f064bf2dae05e08ae9965b7c7e34c36&v=4)](https://github.com/CarlOwOs) | [![Marcfuon](https://avatars3.githubusercontent.com/u/49389563?s=88&u=95fb18db55ceae0b49215950980506783481fbbe&v=4)](https://github.com/marcfuon) |
| --- | --- | --- |
| [Victor Novelle Moriano](https://github.com/Vinomo4) | [Carlos Hurtado Comin](https://github.com/CarlOwOs) | [Marc Fuentes Oncins](https://github.com/marcfuon) |


Students of Data Science and Engineering at [UPC](https://www.upc.edu/ca).

## License

[MIT License](./LICENSE)
