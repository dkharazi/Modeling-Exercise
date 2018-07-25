## Overview

Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement – a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it.

In this analysis, the goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways. More information is available from the website here: http://groupware.les.inf.puc-rio.br/har (see the section on the Weight Lifting Exercise Dataset).

The "classe" variable, which is our response variable, refers to a specific execution of an exercise. Class A corresponds to the specified execution of the exercise, while the other 4 classes correspond to common mistakes. The exercises were performed by six male participants aged between 20-28 years, with little weight lifting experience. We made sure that all participants could easily simulate the mistakes in a safe and controlled manner by using a relatively light dumbbell (1.25kg).

Datasets: [Training Data](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv) [12 MB]; [Testing Data](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv) [15 KB]

## Variable Descriptions

- `Classe:` A specific execution of an exercise.
-  `:` .

(Class A) - exactly according to the specification
(Class B) - throwing the elbows to the front
(Class C) - lifting the dumbbell only halfway
(Class D) - lowering the dumbbell only halfway
(Class E) - throwing the hips to the front

## Setup

1. Download the zip file from here.
2. Unzip the file.
3. Move the data to the same directory as the R script.
4. Adjust the R script accordingly to the directory of the data.
5. Run the R script

## References

Velloso, E.; Bulling, A.; Gellersen, H.; Ugulino, W.; Fuks, H. Qualitative Activity Recognition of Weight Lifting Exercises. Proceedings of 4th International Conference in Cooperation with SIGCHI (Augmented Human '13) . Stuttgart, Germany: ACM SIGCHI, 2013.
