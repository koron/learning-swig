import sys
sys.path.append('./target')

import level3

def func1():
    print('func1()=%d' % level3.func1())

if __name__ == '__main__':
    func1()
