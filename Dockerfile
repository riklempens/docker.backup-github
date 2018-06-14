FROM python:2.7.15-alpine3.7
LABEL maintainer="Rik Lempens <rik@transceptor.technology>"

# Install git
RUN apk update && \
    apk add --no-cache git

# Set the working directory
WORKDIR /usr/src/app

# Add the installation files

COPY install/ ./

RUN pip install --no-cache-dir -r requirements.txt

# Set the data folder
VOLUME /data

ENTRYPOINT ["python","/usr/src/app/backup.py"]
