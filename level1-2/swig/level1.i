%module level1
%{
extern int level1_func1(int a, int b);
%}

#include "level1.hpp"
