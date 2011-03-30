#include <stdlib.h>
#include "level3.hpp"

    int
func1(int a, int b, CALLBACK1 callback1)
{
    if (callback1 != NULL)
        return (*callback1)(a, b);
    else
        return 0;
}
