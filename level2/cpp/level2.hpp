#ifndef LEVEL1_HPP
#define LEVEL1_HPP

#ifdef __cplusplus
extern "C" {
#endif

typedef struct Point_tag {
    int x;
    int y;
    float z;
} Point_t;

int func1(const Point_t* pt);

void func2(const Point_t* pt1, const Point_t* pt2, Point_t* out_pt);

#ifdef __cplusplus
}
#endif

#endif//LEVEL1_HPP
