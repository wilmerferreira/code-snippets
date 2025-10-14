# Python: pip

All the packages can be found in the [python package index](https://pypi.org/). `pip` is the package installer for Python. You can use `pip` to manage packages in your project using the _Python Package Index_ and other indexes.

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
