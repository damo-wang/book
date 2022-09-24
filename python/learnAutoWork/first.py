#!/usr/bin/python3

import random

g=random.randint(1,20)
print("I am thinging of a number between 1 and 20.")

n=0
num=0

while n!=g:
    try:
        n=int(input("Take a guess."))
    except ValueError:
        print("Your input isn't int, Please again")
        continue
    num=num+1
    if(n>g):
        print("Your guess is too high")
    elif(n<g):
        print("Your guess is too low")
    else:
        break
print("Good job! Your guessed my number in "+str(num)+" guess!")