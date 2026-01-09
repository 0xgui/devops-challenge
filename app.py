from flask import Flask
import requests
import os

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Docker!"

if __name__ == "__main__":
    port = int(os.getenv("APP_PORT", 5000))
    app.run(host="127.0.0.1", port=port)
