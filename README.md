# Trade Employment Bootstrapping

# Motivation
While investingating trends present in the trade industry for a class project, it was necessary to develop data visuals to better understand national employment trends. 
Specifically, the goal was to compare the national quit, hire, and unemployment rates with Virginia rates. 
The scope of the project was focused on Virginia employment, so it was important to see how the state compared to national trends. 
There are various comments present in the code file that describe more in depth, key insights from the graphs, but the primary take-away is that bootstrapping was required to better conduct inferential statistics on the data. 

# Code Description
This R program file utilizes data files containing national and statewide employment information to generate various data visualizations that were used to conduct inferential statistics. 
Several of these visuals are created using generated lists comprised of thousands of simulated, resampled means of the original dataset, otherwise known as bootstrapping.
Using the bootstrapped means to create a 95% confidence interval, which is viewable on each of the corresponding visuals, was used to interpret the results. 

Note that bootstrapping was the chosen method to intepret the data as the observed distributions of the original dataset could not be described as normal. 

# Disclaimers

Datasets collected by the United States Bureau of Labor Statistics were utilized and are able to be viewed (a link to the original source of the data is provided in the data file under the "Citations" subsheet). 

This code was written for final project as part of Virginia Tech's undergraduate Analytics in Action course.
