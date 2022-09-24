#!/usr/bin/python3

theBoard={
    'top-L':' ','top-M':' ','top-R':' ',
    'mid-L':' ','mid-M':' ','mid-R':' ',
    'low-L':' ','low-M':' ','low-R':' '
    }

def printBoard(board):
    print(board['top-L']+' | '+board['top-M']+' | '+board['top-R'])
    print('--+---+--')
    print(board['mid-L']+' | '+board['mid-M']+' | '+board['mid-R'])
    print('--+---+--')
    print(board['low-L']+' | '+board['low-M']+' | '+board['low-R'])

theBoard2={
    'top-L':' ','top-M':'X','top-R':' ',
    'mid-L':' ','mid-M':'O','mid-R':' ',
    'low-L':'X','low-M':' ','low-R':' '
    }
printBoard(theBoard2)