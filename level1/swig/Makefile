NAME = _level1
SWIG_SRC = level1.i
SWIG_PY = level1.py
DLLDEF = level1.def
CCFLAGS = /I $(PYTHON_PATH)\include
LDFLAGS = /LIBPATH:$(PYTHON_PATH)\libs /LIBPATH:..\cpp
LIBS = level1.lib
BUILD_TARGET = $(NAME).pyd

PYTHON_PATH = C:\Local\Python\Python27-amd64

WRAP_SRC = $(SWIG_SRC:.i=_wrap.c)
OBJS = $(WRAP_SRC:.c=.obj)

NODEBUG =	1
CCFLAGS = 	$(CCFLAGS) -D_NDEBUG

APPVER = 6.0
TARGETOS = WINNT
TARGETLANG = LANG_JAPANESE
_WIN32_IE = 0x0600
!INCLUDE <win32.mak>

CCFLAGS = 	$(CCFLAGS) \
		-D_CRT_SECURE_NO_WARNINGS=1 \
		-D_BIND_TO_CURRENT_VCLIBS_VERSION=1

build : $(BUILD_TARGET)

clean :
	DEL /F *.obj
	DEL /F *.exe
	DEL /F *.dll
	DEL /F *.lib
	DEL /F *.exp
	DEL /F *.pdb
	DEL /F *.pyd
	DEL /F *.pyc
	DEL /F $(WRAP_SRC)
	DEL /F $(SWIG_PY)

.c.obj ::
	$(CC) /nologo $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) $<

.cpp.obj ::
	$(CC) /nologo $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) $<

$(NAME).exe : $(OBJS)
	$(link) /nologo $(ldebug) $(conlflags) $(conlibsdll) $(LDFLAGS) \
		/OUT:$@ $(OBJS) $(LIBS)
	IF EXIST $@.manifest \
		mt -nologo -manifest $@.manifest -outputresource:$@;1

$(NAME).dll : $(OBJS)
	$(link) /nologo $(ldebug) $(dlllflags) $(conlibsdll) $(LDFLAGS) \
		/OUT:$@ $(OBJS) $(LIBS)
	IF EXIST $@.manifest \
		mt -nologo -manifest $@.manifest -outputresource:$@;2

$(NAME).pyd : $(NAME).dll
	COPY $(NAME).dll $@

$(WRAP_SRC) $(SWIG_PY) : $(SWIG_SRC)
	swig -python $(SWIG_SRC)

.PHONY : build clean
