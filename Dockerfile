FROM python:3
MAINTAINER Mohammad
WORKDIR /src/app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT [ "python","app.py" ]
