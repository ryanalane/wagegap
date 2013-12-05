from flask import Flask, redirect, url_for, render_template

app = Flask(__name__)
app.config['DEBUG'] = True

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def interface(path):
    if path:
        return redirect(url_for('static', filename=path))
    return render_template('wagegap.html')

if __name__ == '__main__':
    app.run()