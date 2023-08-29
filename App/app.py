from flask import Flask,jsonify,request

app = Flask(__name__)

@app.route('/returnjson', methods = ['GET'])
def ReturnJSON():
	data = request.get_json()
	numbers = data.get('numbers', [])
	total_sum = sum(numbers)
    
	return jsonify({'sum': total_sum}), 200

if __name__=='__main__':
    app.run(host='0.0.0.0')
