FROM rocker/shiny
COPY . /workdir

COPY . ./app

# expose port
EXPOSE 4040

# run app on container start
CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 4040)"]
