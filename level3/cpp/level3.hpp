#ifndef LEVEL3_HPP
#define LEVEL3_HPP

#ifdef __cplusplus
extern "C" {
#endif

typedef int(*CALLBACK1)(int, int);

int func1(int a, int b, CALLBACK1 callback1);

#ifdef __cplusplus
}
#endif

#endif//LEVEL3_HPP
