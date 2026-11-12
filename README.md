# Overview

As a software engineer, my goal for this project is to deepen my understanding of functional data processing and statistical computing paradigms using the R programming language. By exploring R's native data handling features, vectorization concepts, and strict type management, I aimed to build a robust tool for data cleaning, validation, and analytics.

I developed an automated **Student Data Cleaning and Preprocessing Pipeline** written in R. The software automatically ingests dataset files (or constructs fallback mock data), performs missing-value inspection using vector analytics, validates numerical boundaries to filter out anomalous data points, categorizes student performances into academic standard grades, and exports structured results into normalized CSV outputs.

The primary purpose of writing this software is to gain practical, hands-on experience with R syntax, data frames, loop structures, vectorized functional operations (`sapply`), conditional branching, and file I/O operations.

[Software Demo Video](https://youtu.be/ducNqOH9e1k)

# Development Environment

To develop and test this software, I utilized the following developer stack and tools:

- **Visual Studio Code (VS Code)**: Configured with the official R extension for code execution, debugging, and workspace inspection.
- **R Interactive Console / Terminal**: Used for script execution, variable inspection, and console log output verification.
- **R Language Engine (v4.x+)**: The core runtime environment used for statistical computing, functional processing, and dataset manipulation.
- **Base R Libraries**: Leveraged built-in R capabilities including data frame utilities, functional programming constructs (`sapply`, `colSums`, `is.na`), and file handling methods (`read.csv`, `write.csv`).

# Useful Websites

- [R Documentation & Manuals](https://www.r-project.org/other-docs.html)
- [An Introduction to R (CRAN)](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)
- [R for Data Science (Hadley Wickham)](https://r4ds.had.co.nz/)

# Future Work

- Implement multi-file batch processing to clean and merge multiple raw dataset CSV files simultaneously.
- Integrate interactive visual plotting using native `graphics` or `ggplot2` to auto-generate performance distributions.
- Add advanced exception and error handling mechanisms for malformed input files or corrupted data schemas.