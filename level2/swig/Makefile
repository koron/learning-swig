NAME =		_level2
TYPE =		dll
DLLDEF = 	empty.def
SRCS =		level2_wrap.cxx

OUTNAME =	_level2.pyd
SWIG_SRC =	level2.i
SWIG_PY = 	level2.py
SWIG_OPT =	-I../cpp
EXTRA_BUILD =	$(TARGET_OUTDIR)\$(SWIG_PY)
EXTRA_CLEAN =	level2.py level2_wrap.cxx

CCFLAGS = 	/I $(PYTHON_PATH)\include /I ..\cpp
LDFLAGS = 	/LIBPATH:$(PYTHON_PATH)\libs /LIBPATH:..\cpp
LIBS = 		level2.lib

RELEASE =	1

!INCLUDE <local.mk>
!INCLUDE <mk\msvc-build.mk>

level2_wrap.cxx $(SWIG_PY) : $(SWIG_SRC)
	swig -c++ -python $(SWIG_OPT) $(SWIG_SRC)

$(TARGET_OUTDIR)\$(SWIG_PY) : $(SWIG_PY)
	COPY $(SWIG_PY) $@
