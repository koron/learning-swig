#include "level2.hpp"

// Simple, input arguments only.
    int
func1(const Point_t* pt)
{
    return pt != 0 ? (int)((pt->x + pt->y) * pt->z + 0.5f) : 0;
}

// Simple, an output argument.
    void
func2(const Point_t* pt1, const Point_t* pt2, Point_t* out_pt)
{
    if (out_pt != 0)
    {
        if (pt1 != 0 && pt2 != 0)
        {
            out_pt->x = pt2->x - pt1->x;
            out_pt->y = pt2->y - pt1->y;
            out_pt->z = pt2->z - pt1->z;
        }
        else
        {
            out_pt->x = 0;
            out_pt->y = 0;
            out_pt->z = 0;
        }
    }
}
