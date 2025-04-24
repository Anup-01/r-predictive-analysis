# script.R

library(ggplot2)
library(rpart)
library(rpart.plot)
library(cluster)
library(forecast)
library(Cairo)

data(mtcars)

# 1. Linear Regression
model1 <- lm(mpg ~ wt, data = mtcars)
CairoPNG("linear_regression.png", width=800, height=600)
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth(method="lm", col="blue") +
  ggtitle("Linear Regression: MPG ~ Weight")
dev.off()

# 2. Multiple Regression
model2 <- lm(mpg ~ wt + hp, data = mtcars)
CairoPNG("multiple_regression.png", width=800, height=600)
ggplot(mtcars, aes(x=wt, y=mpg, color=hp)) +
  geom_point(size=3) +
  ggtitle("Multiple Regression (MPG ~ Weight + HP)")
dev.off()



# 4. Clustering
k <- kmeans(mtcars[,c("mpg", "wt", "hp")], centers = 3)
mtcars$cluster <- as.factor(k$cluster)
CairoPNG("clustering.png", width=800, height=600)
ggplot(mtcars, aes(x=wt, y=mpg, color=cluster)) +
  geom_point(size=3) +
  ggtitle("Clustering of Cars")
dev.off()

# 5. Time Series Forecast
sales <- ts(cumsum(rnorm(36, 20, 5)), frequency=12, start=c(2022,1))
model_ts <- auto.arima(sales)
forecast_sales <- forecast(model_ts, h=12)
CairoPNG("time_series.png", width=800, height=600)
plot(forecast_sales, main="Car Sales Forecast")
dev.off()

