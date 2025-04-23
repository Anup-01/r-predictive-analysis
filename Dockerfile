# Use R base image
FROM r-base

# Install system dependencies for Cairo and other required libraries
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libcairo2-dev \
    libxt-dev

RUN R -e "install.packages(c('ggplot2', 'rpart', 'rpart.plot', 'cluster', 'forecast', 'Cairo'), repos='http://cran.rstudio.com/')"

# Copy your R script into the Docker container
COPY script.R /usr/src/app/script.R

# Set the working directory
WORKDIR /usr/src/app

# Run the R script when the container starts
CMD ["Rscript", "script.R"]
