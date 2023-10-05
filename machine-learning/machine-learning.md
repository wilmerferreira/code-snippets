# Machine Learning

An orchestrated and repeatable patter which systematically transforms and processes information to create prediction solutions.

ML process:

1. Data
2. Algorithm
3. Data Analysis
4. Model

ML workflow:

1. Asking the right question
2. Preparing data
3. Selecting the algorithm
4. Training the model
5. Testing the model

Guidelines

- **Early steps are most important** _Each step depends on previous steps_.
- **Expect to go backwards** _Later knowledge effects previous steps.
- **Data is never as you need it** _Data will have to be altered_.
- **More data is better** _More Data => Better Results_.
- **Don't pursue a bad solution** _Reevaluate, fix or quit_.

Can be used for:

- Is this e-mail span?
- How will people vote?
- What will people buy?

## Machine Learning Vendors

- Analytics vendors
  - SAS Analytics Suite
  - RapidMiner Studio
  - Alteryx
- Megavendors
  - IBM SPSS
  - SAP Predictive Analysis
  - Oracle Advanced Analytics
  - Microsoft Azure Machine Learning

**R** is the main machine learning language, but is possible to use **python** as well

The _first problem_ is ask the **right question**

1. Choosing what question to ask is the most important part of the process
2. **Ask yourself**: Do I have the right data to answer this question?
    - Get that data into good shape.
3. **Ask yourself**: Do I know how I'll measure success?

Is important **rebuild** and **deploy** the model

Some ML concepts

- Training data: Is the process to create/prepared data to create a model. Creating a model is also called training a model.
- Types of learning
  - Supervised: the value you want to predict is in the training data (The data is _labeled_) 
  - Unsupervised: the value you want to predict is **NOT** in the training data (The data is _unlabeled_)
- Classifying ML problems and algorithms
  - Regression: example question: How many units of this product will be sell next month?
  - Classification: example question: Is this credit card transaction fraudulent?
  - Clustering: What are our customer segments?
- Training a model
- Testing a model
- Using a model

The columns/attributes used to train a model are called _features_, in the **Supervised** type this column/attribute is called _target value_.

ML algorithms:

- Decision tree
- Neural network
- Bayesian
- K-means

| Supervised                                           | Unsupervised                             |
|------------------------------------------------------|------------------------------------------|
| Value prediction                                     | Identify clusters of like data           |
| Needs training data containing value being predicted | Data does not contain cluster membership |
| Trained model predicts value in new data             | Model provides access to data by cluster |

Tidy datasets

- each variable is a column
- each observation is a row
- each observational unit is a table
