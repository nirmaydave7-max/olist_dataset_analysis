# Olist E-Commerce Data Analysis

An end-to-end Data Analytics project based on the Brazilian Olist E-Commerce dataset. The project covers data preparation, SQL analysis, Python analysis, and data visualization.

## Project Structure

olist_dataset_analysis/
│
├── SQL_import_analysis/
│   ├── olist_analysis_sql.sql
│   ├── olist import script.sql
│   └── SQL tables used for analysis
│
├── python_analysis/
│   └── customer_dataset_analysis.ipynb
│
├── data/
│   ├── excel_cleaned_files/
│   │   └── ~9 cleaned Excel files
│   │
│   └── raw_csv_files/
│       └── ~9 raw CSV files
│
└── README.md

## 1. SQL Analysis

The `SQL_import_analysis` folder contains the SQL scripts and tables used for database analysis.

### olist import script.sql

This SQL script is used to import and create the tables required for the project.

The tables used for the analysis are also stored inside the `SQL_import_analysis` folder.

### olist_analysis_sql.sql

This is the main SQL analysis file containing queries used to analyze the Olist dataset.

The SQL analysis covers:

- Customer analysis
- Order analysis
- Sales and revenue analysis
- Product analysis
- Product category analysis
- Seller performance
- Payment analysis
- Review analysis
- Delivery analysis
- Customer spending
- Business-oriented analysis

The project also demonstrates SQL concepts such as:

- JOINs
- GROUP BY
- Aggregate functions
- CASE statements
- Subqueries
- CTEs
- Window functions

## 2. Python Analysis

The `python_analysis` folder contains a single Jupyter Notebook:

`customer_dataset_analysis.ipynb`

This notebook contains the complete Python analysis and visualizations for the project.

The analysis is performed using:

- Pandas
- NumPy
- Matplotlib
- Seaborn

The Python notebook follows a complete analysis workflow:

Data Loading
→ Data Cleaning
→ Data Preparation
→ Exploratory Data Analysis
→ Business Analysis
→ Statistical Analysis
→ Visualization

The Python analysis includes:

- Data quality analysis
- Sales and revenue analysis
- Monthly sales analysis
- Order analysis
- Customer analysis
- Repeat vs one-time customer analysis
- RFM analysis
- Product analysis
- Category analysis
- Seller analysis
- Delivery analysis
- Delivery vs review analysis
- Payment analysis
- Correlation analysis
- Statistical summaries
- Data visualizations

## 3. Data

The `data` folder contains the datasets used throughout the project.

It is divided into two folders:

### raw_csv_files

Contains approximately 9 raw CSV files from the Olist dataset.

These files represent the original datasets used as the starting point for the analysis.

### excel_cleaned_files

Contains approximately 9 cleaned Excel files created after the data cleaning process.

These files contain the cleaned and prepared versions of the datasets used for further analysis.

## Project Workflow

The overall project follows this workflow:

Raw CSV Files
      ↓
Data Cleaning
      ↓
Cleaned Excel Files
      ↓
      ├── SQL Tables → SQL Analysis
      │
      └── Python Analysis → Visualizations
      ↓
Business Insights

## Tools and Technologies

- MySQL
- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Microsoft Excel
- Jupyter Notebook
- GitHub

## Skills Demonstrated

This project demonstrates practical Data Analyst skills including:

- Data Cleaning
- Data Preprocessing
- Exploratory Data Analysis
- SQL Analysis
- Multi-table JOINs
- Aggregation
- CTEs
- Window Functions
- Customer Analysis
- RFM Analysis
- Sales Analysis
- Product Analysis
- Category Analysis
- Seller Analysis
- Delivery Analysis
- Statistical Analysis
- Data Visualization
- Business Analysis

## How to Use This Repository

### SQL

1. Open the `SQL_import_analysis` folder.
2. Open `olist import script.sql`.
3. Create and import the required tables.
4. Open `olist_analysis_sql.sql`.
5. Run the queries in MySQL to reproduce the SQL analysis.

### Python

1. Open the `python_analysis` folder.
2. Open `customer_dataset_analysis.ipynb`.
3. Make sure the required datasets are available.
4. Run the notebook from the beginning.
5. Execute the cells sequentially to reproduce the analysis and visualizations.

### Data

The raw datasets are available in:

`data/raw_csv_files/`

The cleaned datasets are available in:

`data/excel_cleaned_files/`

## Project Objective

The objective of this project is to demonstrate an end-to-end Data Analytics workflow using a real-world e-commerce dataset.

The project starts with raw data, performs data cleaning and preparation, and then uses SQL and Python to analyze customers, orders, products, sellers, payments, reviews, sales, and delivery performance.

The final analysis combines database querying, data analysis, statistical analysis, and visualization to extract meaningful business insights from the Olist E-Commerce dataset.
