#!/usr/bin/python3

def collatz(_number):
    if _number%2==0:
        return _number//2
    else:
        #print(3 * _number + 1)
        return 3*_number+1

while True:
    try:
        n=int(input("Enter number(int)"))
        break
    except ValueError:
        print("Please input int")
        continue

while n!=1:
    n=collatz(n)
    print(n)