import os

from flask import Flask


environment = os.environ['ENVIRONMENT']

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/cosee')
def aws():
    return f'Jetzt gehts los auf {environment}!'

if __name__ == "__main__":
    app.run(debug=True)
