from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods = ['GET', 'POST', 'HEAD'])
def index():
    if request.method == 'GET' or request.method == 'POST':
        return "Hello World 2\nPython app\n"
    else:
        return "Hello World 2\nPython app\n"


if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=False, port=80)
