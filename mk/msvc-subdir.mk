!IFNDEF TOPDIR
TOPDIR =	$(MAKEDIR)
!ENDIF

INCLUDE=$(TOPDIR);$(TOPDIR)\..;$(INCLUDE)

MAKEOPTS	= $(MAKEOPTS) TOPDIR=$(TOPDIR)
!IFDEF TARGET_OUTDIR
MAKEOPTS	= $(MAKEOPTS) TARGET_OUTDIR=$(TOPDIR)\$(TARGET_OUTDIR)
!ENDIF

build :
	@FOR %%i IN ($(SUBDIR)) DO @cd %%i \
		& ECHO enter: %%i \
		& $(MAKE) /NOLOGO /$(MAKEFLAGS) $(MAKEOPTS) $* \
		& ECHO leave: %%i \
		& cd $(MAKEDIR)

clean :
	@FOR %%i IN ($(SUBDIR)) DO @cd %%i \
		& ECHO enter: %%i \
		& $(MAKE) /$(MAKEFLAGS) $(MAKEOPTS) $* \
		& ECHO leave: %%i \
		& cd $(MAKEDIR)

distclean :
	@FOR %%i IN ($(SUBDIR)) DO @cd %%i \
		& ECHO enter: %%i \
		& $(MAKE) /$(MAKEFLAGS) $(MAKEOPTS) $* \
		& ECHO leave: %%i \
		& cd $(MAKEDIR)
