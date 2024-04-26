# Explorer of 2023 Our Wisconsin Survey 1&2

This R Shiny application is designed to analyze and visualize data from the "Our Wisconsin" surveys conducted in 2023. These surveys are part of an ongoing inclusivity program at the University of Wisconsin-Madison, aimed at understanding and enhancing the first-year student experience concerning diversity, personal identity, equity, and social justice.

## Background

The "Our Wisconsin" inclusion program began in 2016, responding to student demands for greater diversity and inclusion opportunities in their first year at UW-Madison. Initially a two-hour workshop, the program transitioned to an online format in 2020, becoming a requirement for all incoming first-year students. This shift was part of a broader initiative announced by Chancellor Blank during the summer of 2020, underlining the university's commitment to fostering a culture of inclusivity.

## Objectives of This Application

This application provides a comprehensive analysis of survey responses in 2023, offering insights into the effectiveness of the Our Wisconsin program and student perceptions of inclusivity on campus. By presenting data-driven insights through interactive visualizations, this tool aims to support the university's efforts in making informed decisions to enhance the campus community.

- **Retrospective and Current View**: Analyzes student inclusivity at UW-Madison over the past three years.
- **Strategic Planning Tool**: Serves as a mechanism for improving campus community through targeted recommendations.

## Depolyment
The app is currently deployed at UW-Madison Data Science Platform: https://connect.doit.wisc.edu/DEI_2023OS_DanielYe/
It is also deployed at public free shinyapps.io platform: https://www.shinyapps.io/admin/#/application/11868087

## Features

- **Theme Selection**: Utilizes the Spacelab theme from `shinythemes` for a clean and modern UI.
- **Survey Selection**: Users can choose between "Survey 1" and "Survey 2" to analyze different sets of data.
- **Dynamic Question Selection**: Depending on the selected survey, the questions available for analysis are dynamically updated.
- **Group Selection**: Users can filter the data by different demographic groups, which are dynamically loaded from the dataset.
- **Interactive Analysis**: After selecting specific parameters, users can generate frequency tables and distribution plots by clicking the "Analyze Question" button.

## Data Files

The application requires the following CSV files to be present in the working directory:
- `identity.csv`: Contains demographic information of survey respondents.
- `s1.csv` and `s2.csv`: Contain the survey data for Survey 1 and Survey 2, respectively.


To run this application locally, you will need to install R and the required packages. You can install R from [CRAN](https://cran.r-project.org/). Once R is installed, you can install the necessary packages by running the following commands in your R console:

```R
install.packages("shiny")
install.packages("readr")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("shinythemes")
```
## Running the Application
To launch the application, open R and set your working directory to the folder containing the app files and data. Run the following command:

```R
library(shiny)
runApp()
```

## Project Hosted by

**Office of Inclusion Education at UW-Madison**

Established in August 2020, the Office of Inclusion Education is dedicated to promoting diversity, equity, and inclusion across the University of Wisconsin-Madison. Part of Student Affairs, our office offers a variety of learning opportunities that enhance the Wisconsin Experience. We aim to foster social justice and create a welcoming environment where all Badgers belong. The office encompasses several initiatives including Our Wisconsin, Social Justice Programs, and Social Justice Hubs, integrating longstanding inclusion efforts under one roof.

## Authors
Daniel Ye   
Reonda Washington

## Acknowledgments
This application is developed in support of the University of Wisconsin-Madison's ongoing commitment to diversity, equity, and inclusion.  
Special thanks to Vector Solutions for their collaboration with the university in collecting the survey data.   
Special thanks to all the students who have participated in the Our Wisconsin surveys, helping us strive toward a more inclusive university environment.
