FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN apt-get update -y && apt-get install -y nmap \
    && pip install -r requirements.txt
COPY . /code/
RUN chmod +x /code/entrypoint.sh 
CMD ["/bin/bash","/code/entrypoint.sh"]
EXPOSE 8000
