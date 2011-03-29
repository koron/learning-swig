%module level2
%include "typemaps.i"

%{
/* This block will be included into *_wrap.cxx/c */
#include "level2.hpp"
%}

/*
 * Using typemaps to return arguments
 *
 * See: http://swig.org/Doc2.0/Python.html#Python_nn61
 */

%typemap(python,in,numinputs=0) Point_t* out_pt(Point_t temp) %{
  $1 = &temp;
%}
%typemap(python, argout) Point_t* out_pt %{
  $result = SWIG_Python_AppendOutput($result,
      SWIG_NewPointerObj(
          (new Point_t(static_cast<const Point_t&>(*$1))),
          SWIGTYPE_p_Point_tag,
          SWIG_POINTER_OWN));
%}

%include "level2.hpp"
