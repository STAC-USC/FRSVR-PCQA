Implementation of Full-reference point cloud quality assessment using support vector regression from [1].

# How to use

## Dataset download

This repository does not provide a dataset. 
When you test a sourcecode with the BASICS (Broad Quality Assessment of Static Point Clouds in a Compression Scenario) dataset [3], the point clouds can be downloaded from the URL: https://zenodo.org/records/10533088.

## Calculation of 5 types of FR metrics

5 types of full-reference metrics must be calculated before training and evaluation as follows: 

```bash
Run ScoreCalculator_BASICStraining.m 
Run ScoreCalculator_BASICSTest.m
```

After the calculation, "Scores_BASICStraining.csv" and "Scores_BASICStest.csv" are output in ScoreData folder (These csv files have already been prepared by authors in this repository). 

## Training and test by support vector regression

After calculating the scores, training a support vector regression model and the evaluation are carried out by the following code.

```bash
Run TrainingSVRModel.m
```

# Reference

[1] Ryosuke Watanabe, Shashank N. Sridhara, Haoran Hong, Eduardo Pavez, Keisuke Nonaka, Tatsuya Kobayashi, Antonio Ortega,
Full reference point cloud quality assessment using support vector regression, Signal Processing: Image Communication, Volume 131, 117239, 2025.

```
@article{WATANABE2025117239,
title = {Full reference point cloud quality assessment using support vector regression},
journal = {Signal Processing: Image Communication},
volume = {131},
pages = {117239},
year = {2025},
issn = {0923-5965},
doi = {https://doi.org/10.1016/j.image.2024.117239},
url = {https://www.sciencedirect.com/science/article/pii/S0923596524001401},
author = {Ryosuke Watanabe and Shashank N. Sridhara and Haoran Hong and Eduardo Pavez and Keisuke Nonaka and Tatsuya Kobayashi and Antonio Ortega},
}
```

[2] A. Ak, E. Zerman, M. Quach, A. Chetouani, A. Smolic, G. Valenzise, and P. L. Callet, “Basics: Broad quality assessment of static point clouds in a compression scenario,” IEEE Transactions on Multimedia, pp. 1–13, 2024.

