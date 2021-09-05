from flask import Flask, request

app = Flask(__name__)


@app.route('/', methods = ['POST'])
def text():
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


if __name__ == "__main__":
    app.run(debug=True)
