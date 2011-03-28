NAME =		_level1
TYPE =		dll
DLLDEF = 	empty.def
SRCS =		level1_wrap.cxx

OUTNAME =	_level1.pyd
SWIG_SRC =	level1.i
SWIG_PY = 	level1.py
EXTRA_BUILD =	$(TARGET_OUTDIR)\$(SWIG_PY)
EXTRA_CLEAN =	level1.py level1_wrap.cxx

CCFLAGS = 	/I $(PYTHON_PATH)\include /I ..\cpp
LDFLAGS = 	/LIBPATH:$(PYTHON_PATH)\libs /LIBPATH:..\cpp
LIBS = 		level1.lib

RELEASE =	1

!INCLUDE <local.mk>
!INCLUDE <mk\msvc-build.mk>

level1_wrap.cxx $(SWIG_PY) : $(SWIG_SRC)
	swig -c++ -python $(SWIG_SRC)

$(TARGET_OUTDIR)\$(SWIG_PY) : $(SWIG_PY)
	COPY $(SWIG_PY) $@
