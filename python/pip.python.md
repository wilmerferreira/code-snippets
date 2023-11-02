# Python: pip

`pip` is the package installer for Python. You can use pip to install packages from the Python Package Index and other indexes

```py
python -m pip install requests

# Shorter version
pip install requests

# Upgrade pip
python -m pip install --upgrade pip
```

```py
import requests

my_request = requests.get('http://go.codeschool.com/spamvanmenu')
menu_list = my_request.json()

# print(menu_list)
print("Today's menu")

for item in menu_list:
  # print(item['name'], item['desc'], item['price'])
  print(item['name'], ': ', item['desc'].title(), ', $', item['price'], sep = '')
```
