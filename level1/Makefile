NAME = level1
SRCS = level1.cpp
DLLDEF = level1.def
CCFLAGS =
LDFLAGS =
LIBS =
BUILD_TARGET = $(NAME).dll

OBJS = $(SRCS:.cpp=.obj)

APPVER = 6.0
TARGETOS = WINNT
TARGETLANG = LANG_JAPANESE
_WIN32_IE = 0x0600
!INCLUDE <win32.mak>

CCFLAGS = 	$(CCFLAGS) \
		-D_CRT_SECURE_NO_WARNINGS=1 \
		-D_BIND_TO_CURRENT_VCLIBS_VERSION=1 \
		-W3

build : $(BUILD_TARGET)

clean :
	DEL /F *.obj
	DEL /F $(BUILD_TARGET)
	DEL /F *.lib
	DEL /F *.exp
	DEL /F *.pdb

.c.obj ::
	$(CC) /NOLOGO $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) $<

.cpp.obj ::
	$(CC) /NOLOGO $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) $<

$(NAME).exe : $(OBJS)
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LDFLAGS) \
		/OUT:$@ $(OBJS) $(LIBS)
	IF EXIST $@.manifest \
		mt -nologo -manifest $@.manifest -outputresource:$@;1

$(NAME).dll : $(OBJS) $(DLLDEF)
	$(link) /NOLOGO $(ldebug) $(dlllflags) $(conlibsdll) $(LDFLAGS) \
		/OUT:$@ /DEF:$(DLLDEF) $(OBJS) $(LIBS)
	IF EXIST $@.manifest \
		mt -nologo -manifest $@.manifest -outputresource:$@;2

.PHONY : build clean
