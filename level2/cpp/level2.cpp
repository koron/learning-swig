#include "level2.hpp"

// Simple, an input argument.
    int
func1(const Point_t* pt)
{
    return pt != 0 ? (int)((pt->x + pt->y) * pt->z + 0.5f) : 0;
}

// Simple, an output argument.
    void
func2(const Point_t* pt1, const Point_t* pt2, Point_t* pt)
{
    if (pt != 0)
    {
        if (pt1 != 0 && pt2 != 0)
        {
            pt->x = pt2->x - pt1->x;
            pt->y = pt2->y - pt1->y;
            pt->z = pt2->z - pt1->z;
        }
        else
        {
            pt->x = 0;
            pt->y = 0;
            pt->z = 0;
        }
    }
}
