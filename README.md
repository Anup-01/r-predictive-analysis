# 🔍 R Predictive Analysis with CI/CD

This project demonstrates 5 types of predictive analysis and data visualization using the R programming language on the classic `mtcars` dataset. The workflow is containerized using Docker and can be integrated with Jenkins for CI/CD automation.

---

## 📊 Analyses Performed

1. **Linear Regression** – MPG predicted from car weight  
2. **Multiple Regression** – MPG predicted from weight and horsepower  
3. **Decision Tree** – Classify cars based on MPG (High/Low)  
4. **Clustering** – K-means clustering on MPG, weight, and horsepower  
5. **Time Series Forecasting** – Simulated monthly sales forecast using ARIMA  

Each analysis outputs a `.png` chart inside the project directory.

---

## 🚀 How to Run with Docker

### Step 1: Build the Docker image

```bash
docker build -t r-analysis .
