#!/usr/bin/env python3

from lxml import html
import requests
import random
import sys

def get_animals(letter):
    if letter is None:
        return []
    page = requests.get(f'https://a-z-animals.com/animals/pictures/{letter.upper()[0]}/')
    tree = html.fromstring(page.content)
    xpath_for_img = '//article/div[2]/div/div/div/a[1]/img/@src'
    imgs = ['https://a-z-animals.com' + x for x in tree.xpath(xpath_for_img)]
    xpath_for_names = '//article/div[2]/div/div/div/a[2]/b/text()'
    names = tree.xpath(xpath_for_names)
    return list(zip(names, imgs))

def pick_random_animals( animals, count=1):
    c = count if count <= len(animals) else len(animals)
    return random.sample(animals, c)

def go(letter, count):
    if letter is None:
        return
    names = get_animals(letter)
    choices = pick_random_animals(names, count)
    for name,img in choices:
        print(f'name: {name}')
        print(f'img : {img}\n')

def print_usage():
    print(f'''usage:
{sys.argv[0]} letter [count]

letter        - A-Z character
count         - (optional) number of names to return. must be >= 1
''')

args = sys.argv[1:]
nargs = len(args)

if nargs == 0 or nargs > 2:
    print_usage()
else:
    count = 1
    letter = args[0]
    if nargs == 2:
        if letter.isnumeric():
            count = int(letter)
            letter = args[1]
        else:
            count = int(args[1])
    if count < 1 or letter.isnumeric():
        print_usage()
    else: 
        go(letter, count)
