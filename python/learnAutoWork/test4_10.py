#!/usr/bin/python3

spam=['apples','bananas','tofu','cats']

def list2str(spam):
    str=''
    for s in spam:
        if spam.index(s)<len(spam)-1:
            str=str+s+', '
        else:
            str=str + 'and '+s
    return str

print(list2str(spam))