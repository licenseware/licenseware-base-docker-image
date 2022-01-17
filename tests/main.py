from flask import Flask
from licenseware.utils.logger import log


app = Flask(__name__)

log.info("started")


@app.route("/")
def index():
    log.info("it works")
    return "It works!"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)