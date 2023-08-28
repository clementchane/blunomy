# model.py
import json

def calculate_sum(data):
    numbers = data.get('numbers', [])
    total_sum = sum(numbers)
    return {'sum': total_sum}

# Flask or FastAPI can be used for creating a web service to expose the model
