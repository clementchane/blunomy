from flask import Flask,jsonify,request

app = Flask(__name__)

@app.route('/returnjson', methods = ['GET'])
def ReturnJSON():
	if(request.method == 'GET'):
		data = {
			"Hello" : "World"
		}

		return jsonify(data)

if __name__=='__main__':
	app.run(debug=True)
