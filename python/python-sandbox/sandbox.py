import json
import requests # python -m pip install requests
import os
from dotenv import load_dotenv

load_dotenv()

base_url = os.getenv('BASE_URL')

print()

def simple_get_example():
    api_url = "https://jsonplaceholder.typicode.com/todos/1"

    response = requests.get(api_url)

    if response.status_code < 300:
        print(json.dumps(response.json(), indent=2))

def simple_post_example():
    json_payload = {
        "key0": False,
        "key1": 1,
        "key2": '2nd value'
    }

    response = requests.post(f'{base_url}/post', json=json_payload)

    print(f'Status: {response.status_code}')

    print(response.json())

get_all_products()

# object = json.load(response, indent=2)

# print(object)