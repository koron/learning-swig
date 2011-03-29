import sys
sys.path.append('./target')

import level2

def dumpPoint(pt, label):
    print('Point:%s={%d,%d,%f}' % (label, pt.x, pt.y, pt.z))

def newPoint(x, y, z):
    pt = level2.Point_t()
    pt.x = x
    pt.y = y
    pt.z = z
    return pt

def func1():
    pt1 = newPoint(10, 20, 0.1)
    print(level2.func1(pt1))
    pt2 = newPoint(10, 20, 0.5)
    print(level2.func1(pt2))
    pt3 = newPoint(10, 20, 1.0)
    print(level2.func1(pt3))

def func2():
    p1 = newPoint(1, 2, 3.5);
    p2 = newPoint(10, 20, 30);
    out = newPoint(0, 0, 0)
    level2.func2(p1, p2, out)
    dumpPoint(out, 'func2-1')

if __name__ == '__main__':
    func1()
    func2()
