# temporary server (only for development)

from flask import Flask, redirect, url_for

app = Flask(__name__, static_folder="docs", static_url_path="/")

@app.route("/")
def index():
    return redirect(url_for("static", filename="index.html"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000", debug=True)
