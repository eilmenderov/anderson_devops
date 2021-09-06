from flask import Flask, request
import emoji

app = Flask(__name__)


@app.route('/', methods = ['GET', 'POST'])
def text():
    if request.method == 'GET' or request.method == 'POST':
        data = request.get_json(force=True)
        animal = data.get('animal', -1)
        if animal == -1:
            return "Bad request\n"
        sound = data.get('sound', -1)
        if sound == -1:
            return "Bad request\n"
        count = int(data.get('count', -1))
        if count <= 0:
            return "Bad request\n"
        rez = str((animal + " says " + sound + "\n") * count)
        rez = rez + "Made with by Avchar\n"
        return rez
    else:
        return "Bad request\n"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True)
