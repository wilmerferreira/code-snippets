# Python: Collections

## Lists

Use `[]` to retrieve a list (array) elements, its items are ordered, changeable, and allow duplicate values.

```py
# initialize blank list
blank_list = []

# initialize list with values
list_with_values = [1, 3, 5, 7, 9]

# retrieves the 3rd element of the list
secondElement = array[2]

# retrieve range of elements
array[4:8] # between the 4 and the 8 position
array[4:]  # from the 4th position to the end
array[:8]  # to the 8th position

# add new items
blank_list.append(100)

# remove item
list_with_values.remove(5)

# remove item by index
del list_with_values[2]
```

## Tuples

## Sets

## Dictionaries

```py
empty_dictionary = {}
dictionary_with_items = {a: 'value', b: 10, c: 9.9, 'other': '?'}

# add/update a new item
empty_dictionary['key'] = 'value'

# delete item
del empty_dictionary['key']

# get an item
empty_dictionary['key'] # but if the item doesn't exists it will thrown an error
empty_dictionary.get('key')

# for each syntax
for item in dictionary_with_items:
  print(item)

# for each with key/value pair syntax
for key, value in dictionary_with_items.items():
  print(key, value)
```
