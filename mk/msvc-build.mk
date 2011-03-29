# Parameters:
# 	NAME
# 	TYPE
# 	SRC
# 	CCFLAGS
# 	LDFLAGS
# 	LIBS
# 	DLLDEF
# 	TARGET_OUTDIR
# 	RELEASE

OBJS1 =		$(SRCS:.cpp=.obj)
OBJS2 =		$(OBJS1:.cxx=.obj)
OBJS =		$(OBJS2:.c=.obj)

TARGET1 =	$(NAME).$(TYPE)
!IFDEF TARGET_OUTDIR
!IFDEF OUTNAME
TARGET2 =	$(TARGET_OUTDIR)\$(OUTNAME)
!ELSE
TARGET2 =	$(TARGET_OUTDIR)\$(TARGET1)
!ENDIF
TARGET =	$(TARGET2)
!ELSE
TARGET_OUTDIR =	$(MAKEDIR)\tmp
TARGET2 =	$(TARGET1)_
TARGET =	$(TARGET1)
!ENDIF

!IFDEF RELEASE
NODEBUG = 	1
CCFLAGS = 	$(CCFLAGS) -D_NDEBUG
!ELSE
CCFLAGS = 	$(CCFLAGS) -D_DEBUG
!ENDIF

CCFLAGS =	$(CCFLAGS) \
		/D_CRT_SECURE_NO_WARNINGS=1 \
		/D_BIND_TO_CURRENT_VCLIBS_VERSION=1 \
		/W3
CPPFLAGS =	$(CCFLAGS) \
		/EHsc

APPVER =	6.0
TARGETOS =	WINNT
TARGETLANG =	LANG_JAPANESE
_WIN32_IE = 	0x0600

!INCLUDE <win32.mak>

build : $(TARGET) $(EXTRA_BUILD)

clean :
	-DEL /F $(OBJS) $(TARGET1) $(EXTRA_CLEAN)
	-DEL /F *.lib
	-DEL /F *.exp
	-DEL /F *.pdb

distclean : clean
	-DEL /F $(TARGET2)
	@IF EXIST $(TARGET_OUTDIR)\$(NULL) RD /S /Q $(TARGET_OUTDIR)

.c.obj ::
	$(cc) /nologo $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) $<

.cpp.obj ::
	$(cc) /nologo $(cdebug) $(cflags) $(cvarsdll) $(CPPFLAGS) $<

.cxx.obj ::
	$(cc) /nologo $(cdebug) $(cflags) $(cvarsdll) $(CPPFLAGS) $<

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

$(TARGET2) : $(TARGET1)
	@IF NOT EXIST $(TARGET_OUTDIR)\$(NULL) MKDIR $(TARGET_OUTDIR)
	COPY $(TARGET1) $(TARGET2)

.PHONY : build clean distclean
