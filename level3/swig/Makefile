NAME =		_level3
TYPE =		dll
DLLDEF = 	empty.def
SRCS =		level3_wrap.cxx

OUTNAME =	_level3.pyd
SWIG_SRC =	level3.i
SWIG_PY = 	level3.py
SWIG_OPT =	-I../cpp
EXTRA_BUILD =	$(TARGET_OUTDIR)\$(SWIG_PY)
EXTRA_CLEAN =	level3.py level3_wrap.cxx

CCFLAGS = 	/I $(PYTHON_PATH)\include /I ..\cpp
LDFLAGS = 	/LIBPATH:$(PYTHON_PATH)\libs /LIBPATH:..\cpp
LIBS = 		level3.lib

RELEASE =	1

!INCLUDE <local.mk>
!INCLUDE <mk\msvc-build.mk>

level3_wrap.cxx $(SWIG_PY) : $(SWIG_SRC)
	swig -c++ -python $(SWIG_OPT) $(SWIG_SRC)

$(TARGET_OUTDIR)\$(SWIG_PY) : $(SWIG_PY)
	COPY $(SWIG_PY) $@
