import random

def RandomStringGenerator(l=12, a = 'abcdefghijklmnoprstuvwxyz0123456789'):
    s = ''.join(random.choice(a) for i in range(l))
    return s

import sys

def BatchStringGenerator(n, a=8, b=12):
    if a > b:
        sys.exit('Incorrect min and max string lengths. Try again.')

    if a < b:
        r = [RandomStringGenerator(random.choice(range(a,b))) for i in range(n)]

    if a == b:
        r = [RandomStringGenerator(a) for i in range(n)]
    return r



if __name__ =='__main__':
    a = input('Enter minimum string length: ')
    b = input('Enter maximum string length: ')
    n = input('How many random strings to generate? ')

    print(BatchStringGenerator(int(n), int(a), int(b)))
