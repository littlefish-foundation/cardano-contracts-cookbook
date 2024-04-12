from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('main.html')   # Render the HTML code upon accessing the root URL

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8050)    # Run the Flask app