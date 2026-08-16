# Explorer of 2023 Our Wisconsin Survey 1&2

This R Shiny application was developed to analyze and visualize data from the 2023 "Our Wisconsin" surveys at the University of Wisconsin-Madison.

## Background

The Our Wisconsin program studies aspects of the first-year student experience related to diversity, identity, equity, inclusion, and campus belonging. This repository preserves the application logic and survey metadata used for the analysis.

## Objectives of This Application

- Explore survey responses through interactive visualizations.
- Compare patterns across survey questions and demographic groups.
- Support retrospective analysis and program evaluation.

## Features

- **Theme Selection**: Uses the Spacelab theme from `shinythemes`.
- **Survey Selection**: Supports Survey 1 and Survey 2.
- **Dynamic Question Selection**: Available questions update based on the selected survey.
- **Group Selection**: Supports demographic subgroup analysis when authorized data are supplied locally.
- **Interactive Analysis**: Generates frequency tables and distribution plots.

## Data Privacy

Participant-level survey and demographic data are **not distributed with this public repository**. The application was originally developed using restricted project data, including demographic attributes and individual survey responses. Those data should only be used by authorized users under the applicable institutional data-use and privacy requirements.

The repository may include survey dictionaries or metadata that describe question and response coding, but not participant-level response files.

To run the application with real data, authorized users must provide the required input files locally. Do not commit restricted participant-level data to this repository.

## Local Setup

Install R and the required packages:

```R
install.packages("shiny")
install.packages("readr")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("shinythemes")
```

Then launch the application from the project directory:

```R
library(shiny)
runApp()
```

## Project Context

This application was developed in support of the Office of Inclusion Education at UW-Madison.

## Authors

Daniel Ye  
Reonda Washington

## Acknowledgments

Thanks to the University of Wisconsin-Madison Office of Inclusion Education, Vector Solutions, and the students who participated in the Our Wisconsin surveys.
