%module level3
%include "typemaps.i"

%{
/* This block will be included into *_wrap.cxx/c */
#include "level3.hpp"
%}

%include "level3.hpp"
