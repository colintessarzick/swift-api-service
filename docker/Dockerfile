FROM python:3.11.2-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5813
CMD ["python3", "-m", "flask", "--app", "src/application", "run", "--host=0.0.0.0", "--port=5813"]
