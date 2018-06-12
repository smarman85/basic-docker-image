from flask import Flask, flash, redirect, render_template, request, session, abort
app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/work")
def work():
    return render_template('work.html')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True, port=80)
