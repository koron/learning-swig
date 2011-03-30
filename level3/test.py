import sys
sys.path.append('./target')

import level3

def callback1(a, b):
    print("callback1: a=%d b=%d" % (a, b))
    return a + b

def func1():
    print('func1()=%d' % level3.func1(10, 20, callback1))

if __name__ == '__main__':
    func1()
