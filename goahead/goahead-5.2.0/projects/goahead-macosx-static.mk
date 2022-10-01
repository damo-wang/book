#
#   goahead-macosx-static.mk -- Makefile to build Embedthis GoAhead for macosx
#

NAME                  := goahead
VERSION               := 5.2.0
PROFILE               ?= static
ARCH                  ?= $(shell uname -m | sed 's/i.86/x86/;s/x86_64/x64/;s/arm.*/arm/;s/mips.*/mips/')
CC_ARCH               ?= $(shell echo $(ARCH) | sed 's/x86/i686/;s/x64/x86_64/')
OS                    ?= macosx
CC                    ?= clang
AR                    ?= ar
CONFIG                ?= $(OS)-$(ARCH)-$(PROFILE)
BUILD                 ?= build/$(CONFIG)
LBIN                  ?= $(BUILD)/bin
PATH                  := $(LBIN):$(PATH)

ME_COM_COMPILER       ?= 1
ME_COM_LIB            ?= 1
ME_COM_MATRIXSSL      ?= 0
ME_COM_MBEDTLS        ?= 1
ME_COM_NANOSSL        ?= 0
ME_COM_OPENSSL        ?= 0
ME_COM_OSDEP          ?= 1
ME_COM_SSL            ?= 1
ME_COM_VXWORKS        ?= 0

ME_COM_OPENSSL_PATH   ?= "/path/to/openssl"

ifeq ($(ME_COM_LIB),1)
    ME_COM_COMPILER := 1
endif
ifeq ($(ME_COM_MBEDTLS),1)
    ME_COM_SSL := 1
endif
ifeq ($(ME_COM_OPENSSL),1)
    ME_COM_SSL := 1
endif

CFLAGS                += -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security -w
DFLAGS                +=  $(patsubst %,-D%,$(filter ME_%,$(MAKEFLAGS))) -DME_COM_COMPILER=$(ME_COM_COMPILER) -DME_COM_LIB=$(ME_COM_LIB) -DME_COM_MATRIXSSL=$(ME_COM_MATRIXSSL) -DME_COM_MBEDTLS=$(ME_COM_MBEDTLS) -DME_COM_NANOSSL=$(ME_COM_NANOSSL) -DME_COM_OPENSSL=$(ME_COM_OPENSSL) -DME_COM_OSDEP=$(ME_COM_OSDEP) -DME_COM_SSL=$(ME_COM_SSL) -DME_COM_VXWORKS=$(ME_COM_VXWORKS) 
IFLAGS                += "-I$(BUILD)/inc"
LDFLAGS               += '-Wl,-rpath,@executable_path/' '-Wl,-rpath,@loader_path/'
LIBPATHS              += -L$(BUILD)/bin
LIBS                  += -ldl -lpthread -lm

DEBUG                 ?= debug
CFLAGS-debug          ?= -g
DFLAGS-debug          ?= -DME_DEBUG
LDFLAGS-debug         ?= -g
DFLAGS-release        ?= 
CFLAGS-release        ?= -O2
LDFLAGS-release       ?= 
CFLAGS                += $(CFLAGS-$(DEBUG))
DFLAGS                += $(DFLAGS-$(DEBUG))
LDFLAGS               += $(LDFLAGS-$(DEBUG))

ME_ROOT_PREFIX        ?= 
ME_BASE_PREFIX        ?= $(ME_ROOT_PREFIX)/usr/local
ME_DATA_PREFIX        ?= $(ME_ROOT_PREFIX)/
ME_STATE_PREFIX       ?= $(ME_ROOT_PREFIX)/var
ME_APP_PREFIX         ?= $(ME_BASE_PREFIX)/lib/$(NAME)
ME_VAPP_PREFIX        ?= $(ME_APP_PREFIX)/$(VERSION)
ME_BIN_PREFIX         ?= $(ME_ROOT_PREFIX)/usr/local/bin
ME_INC_PREFIX         ?= $(ME_ROOT_PREFIX)/usr/local/include
ME_LIB_PREFIX         ?= $(ME_ROOT_PREFIX)/usr/local/lib
ME_MAN_PREFIX         ?= $(ME_ROOT_PREFIX)/usr/local/share/man
ME_SBIN_PREFIX        ?= $(ME_ROOT_PREFIX)/usr/local/sbin
ME_ETC_PREFIX         ?= $(ME_ROOT_PREFIX)/etc/$(NAME)
ME_WEB_PREFIX         ?= $(ME_ROOT_PREFIX)/var/www/$(NAME)
ME_LOG_PREFIX         ?= $(ME_ROOT_PREFIX)/var/log/$(NAME)
ME_SPOOL_PREFIX       ?= $(ME_ROOT_PREFIX)/var/spool/$(NAME)
ME_CACHE_PREFIX       ?= $(ME_ROOT_PREFIX)/var/spool/$(NAME)/cache
ME_SRC_PREFIX         ?= $(ME_ROOT_PREFIX)$(NAME)-$(VERSION)


TARGETS               += $(BUILD)/bin/goahead
TARGETS               += $(BUILD)/bin/goahead-test
TARGETS               += $(BUILD)/bin/gopass

unexport CDPATH

ifndef SHOW
.SILENT:
endif

all build compile: prep $(TARGETS)

.PHONY: prep

prep:
	@echo "      [Info] Use "make SHOW=1" to trace executed commands."
	@if [ "$(CONFIG)" = "" ] ; then echo WARNING: CONFIG not set ; exit 255 ; fi
	@if [ "$(ME_APP_PREFIX)" = "" ] ; then echo WARNING: ME_APP_PREFIX not set ; exit 255 ; fi
	@[ ! -x $(BUILD)/bin ] && mkdir -p $(BUILD)/bin; true
	@[ ! -x $(BUILD)/inc ] && mkdir -p $(BUILD)/inc; true
	@[ ! -x $(BUILD)/obj ] && mkdir -p $(BUILD)/obj; true
	@[ ! -f $(BUILD)/inc/me.h ] && cp projects/goahead-macosx-static-me.h $(BUILD)/inc/me.h ; true
	@if ! diff $(BUILD)/inc/me.h projects/goahead-macosx-static-me.h >/dev/null ; then\
		cp projects/goahead-macosx-static-me.h $(BUILD)/inc/me.h  ; \
	fi; true
	@if [ -f "$(BUILD)/.makeflags" ] ; then \
		if [ "$(MAKEFLAGS)" != "`cat $(BUILD)/.makeflags`" ] ; then \
			echo "   [Warning] Make flags have changed since the last build" ; \
			echo "   [Warning] Previous build command: "`cat $(BUILD)/.makeflags`"" ; \
		fi ; \
	fi
	@echo "$(MAKEFLAGS)" >$(BUILD)/.makeflags

clean:
	rm -f "$(BUILD)/obj/action.o"
	rm -f "$(BUILD)/obj/alloc.o"
	rm -f "$(BUILD)/obj/auth.o"
	rm -f "$(BUILD)/obj/cgi.o"
	rm -f "$(BUILD)/obj/cgitest.o"
	rm -f "$(BUILD)/obj/crypt.o"
	rm -f "$(BUILD)/obj/file.o"
	rm -f "$(BUILD)/obj/fs.o"
	rm -f "$(BUILD)/obj/goahead-mbedtls.o"
	rm -f "$(BUILD)/obj/goahead-openssl.o"
	rm -f "$(BUILD)/obj/goahead.o"
	rm -f "$(BUILD)/obj/gopass.o"
	rm -f "$(BUILD)/obj/http.o"
	rm -f "$(BUILD)/obj/js.o"
	rm -f "$(BUILD)/obj/jst.o"
	rm -f "$(BUILD)/obj/mbedtls.o"
	rm -f "$(BUILD)/obj/options.o"
	rm -f "$(BUILD)/obj/osdep.o"
	rm -f "$(BUILD)/obj/rom.o"
	rm -f "$(BUILD)/obj/route.o"
	rm -f "$(BUILD)/obj/runtime.o"
	rm -f "$(BUILD)/obj/socket.o"
	rm -f "$(BUILD)/obj/test.o"
	rm -f "$(BUILD)/obj/time.o"
	rm -f "$(BUILD)/obj/upload.o"
	rm -f "$(BUILD)/bin/goahead"
	rm -f "$(BUILD)/bin/goahead-test"
	rm -f "$(BUILD)/bin/gopass"
	rm -f "$(BUILD)/.install-certs-modified"
	rm -f "$(BUILD)/bin/libgo.a"
	rm -f "$(BUILD)/bin/libgoahead-mbedtls.a"
	rm -f "$(BUILD)/bin/libmbedtls.a"

clobber: clean
	rm -fr ./$(BUILD)

#
#   embedtls.h
#
DEPS_1 += src/mbedtls/embedtls.h

$(BUILD)/inc/embedtls.h: $(DEPS_1)
	@echo '      [Copy] $(BUILD)/inc/embedtls.h'
	mkdir -p "$(BUILD)/inc"
	cp src/mbedtls/embedtls.h $(BUILD)/inc/embedtls.h

#
#   me.h
#

$(BUILD)/inc/me.h: $(DEPS_2)

#
#   osdep.h
#
DEPS_3 += src/osdep/osdep.h
DEPS_3 += $(BUILD)/inc/me.h

$(BUILD)/inc/osdep.h: $(DEPS_3)
	@echo '      [Copy] $(BUILD)/inc/osdep.h'
	mkdir -p "$(BUILD)/inc"
	cp src/osdep/osdep.h $(BUILD)/inc/osdep.h

#
#   goahead.h
#
DEPS_4 += src/goahead.h
DEPS_4 += $(BUILD)/inc/me.h
DEPS_4 += $(BUILD)/inc/osdep.h

$(BUILD)/inc/goahead.h: $(DEPS_4)
	@echo '      [Copy] $(BUILD)/inc/goahead.h'
	mkdir -p "$(BUILD)/inc"
	cp src/goahead.h $(BUILD)/inc/goahead.h

#
#   js.h
#
DEPS_5 += src/js.h
DEPS_5 += $(BUILD)/inc/goahead.h

$(BUILD)/inc/js.h: $(DEPS_5)
	@echo '      [Copy] $(BUILD)/inc/js.h'
	mkdir -p "$(BUILD)/inc"
	cp src/js.h $(BUILD)/inc/js.h

#
#   mbedtls.h
#
DEPS_6 += src/mbedtls/mbedtls.h

$(BUILD)/inc/mbedtls.h: $(DEPS_6)
	@echo '      [Copy] $(BUILD)/inc/mbedtls.h'
	mkdir -p "$(BUILD)/inc"
	cp src/mbedtls/mbedtls.h $(BUILD)/inc/mbedtls.h

#
#   mps_reader.h
#

$(BUILD)/inc/mps_reader.h: $(DEPS_7)

#
#   mps_trace.h
#

$(BUILD)/inc/mps_trace.h: $(DEPS_8)

#
#   crypto.h
#

$(BUILD)/inc/psa/crypto.h: $(DEPS_9)

#
#   ssl_tls13_keys.h
#

$(BUILD)/inc/ssl_tls13_keys.h: $(DEPS_10)

#
#   action.o
#
DEPS_11 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/action.o: \
    src/action.c $(DEPS_11)
	@echo '   [Compile] $(BUILD)/obj/action.o'
	$(CC) -c -o $(BUILD)/obj/action.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/action.c

#
#   alloc.o
#
DEPS_12 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/alloc.o: \
    src/alloc.c $(DEPS_12)
	@echo '   [Compile] $(BUILD)/obj/alloc.o'
	$(CC) -c -o $(BUILD)/obj/alloc.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/alloc.c

#
#   auth.o
#
DEPS_13 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/auth.o: \
    src/auth.c $(DEPS_13)
	@echo '   [Compile] $(BUILD)/obj/auth.o'
	$(CC) -c -o $(BUILD)/obj/auth.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/auth.c

#
#   cgi.o
#
DEPS_14 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/cgi.o: \
    src/cgi.c $(DEPS_14)
	@echo '   [Compile] $(BUILD)/obj/cgi.o'
	$(CC) -c -o $(BUILD)/obj/cgi.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/cgi.c

#
#   cgitest.o
#

$(BUILD)/obj/cgitest.o: \
    test/cgitest.c $(DEPS_15)
	@echo '   [Compile] $(BUILD)/obj/cgitest.o'
	$(CC) -c -o $(BUILD)/obj/cgitest.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) $(IFLAGS) test/cgitest.c

#
#   crypt.o
#
DEPS_16 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/crypt.o: \
    src/crypt.c $(DEPS_16)
	@echo '   [Compile] $(BUILD)/obj/crypt.o'
	$(CC) -c -o $(BUILD)/obj/crypt.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/crypt.c

#
#   file.o
#
DEPS_17 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/file.o: \
    src/file.c $(DEPS_17)
	@echo '   [Compile] $(BUILD)/obj/file.o'
	$(CC) -c -o $(BUILD)/obj/file.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/file.c

#
#   fs.o
#
DEPS_18 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/fs.o: \
    src/fs.c $(DEPS_18)
	@echo '   [Compile] $(BUILD)/obj/fs.o'
	$(CC) -c -o $(BUILD)/obj/fs.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/fs.c

#
#   goahead-mbedtls.o
#
DEPS_19 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/goahead-mbedtls.o: \
    src/goahead-mbedtls/goahead-mbedtls.c $(DEPS_19)
	@echo '   [Compile] $(BUILD)/obj/goahead-mbedtls.o'
	$(CC) -c -o $(BUILD)/obj/goahead-mbedtls.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" $(IFLAGS) src/goahead-mbedtls/goahead-mbedtls.c

#
#   goahead-openssl.o
#
DEPS_20 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/goahead-openssl.o: \
    src/goahead-openssl/goahead-openssl.c $(DEPS_20)
	@echo '   [Compile] $(BUILD)/obj/goahead-openssl.o'
	$(CC) -c -o $(BUILD)/obj/goahead-openssl.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) $(IFLAGS) "-I$(BUILD)/inc" "-I$(ME_COM_OPENSSL_PATH)/include" src/goahead-openssl/goahead-openssl.c

#
#   goahead.o
#
DEPS_21 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/goahead.o: \
    src/goahead.c $(DEPS_21)
	@echo '   [Compile] $(BUILD)/obj/goahead.o'
	$(CC) -c -o $(BUILD)/obj/goahead.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/goahead.c

#
#   gopass.o
#
DEPS_22 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/gopass.o: \
    src/utils/gopass.c $(DEPS_22)
	@echo '   [Compile] $(BUILD)/obj/gopass.o'
	$(CC) -c -o $(BUILD)/obj/gopass.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/utils/gopass.c

#
#   http.o
#
DEPS_23 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/http.o: \
    src/http.c $(DEPS_23)
	@echo '   [Compile] $(BUILD)/obj/http.o'
	$(CC) -c -o $(BUILD)/obj/http.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/http.c

#
#   js.o
#
DEPS_24 += $(BUILD)/inc/js.h

$(BUILD)/obj/js.o: \
    src/js.c $(DEPS_24)
	@echo '   [Compile] $(BUILD)/obj/js.o'
	$(CC) -c -o $(BUILD)/obj/js.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/js.c

#
#   jst.o
#
DEPS_25 += $(BUILD)/inc/goahead.h
DEPS_25 += $(BUILD)/inc/js.h

$(BUILD)/obj/jst.o: \
    src/jst.c $(DEPS_25)
	@echo '   [Compile] $(BUILD)/obj/jst.o'
	$(CC) -c -o $(BUILD)/obj/jst.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/jst.c

#
#   mbedtls.h
#

src/mbedtls/mbedtls.h: $(DEPS_26)

#
#   mbedtls.o
#
DEPS_27 += src/mbedtls/mbedtls.h
DEPS_27 += $(BUILD)/inc/psa/crypto.h
DEPS_27 += $(BUILD)/inc/mps_reader.h
DEPS_27 += $(BUILD)/inc/mps_trace.h
DEPS_27 += $(BUILD)/inc/ssl_tls13_keys.h

$(BUILD)/obj/mbedtls.o: \
    src/mbedtls/mbedtls.c $(DEPS_27)
	@echo '   [Compile] $(BUILD)/obj/mbedtls.o'
	$(CC) -c -o $(BUILD)/obj/mbedtls.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" $(IFLAGS) src/mbedtls/mbedtls.c

#
#   options.o
#
DEPS_28 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/options.o: \
    src/options.c $(DEPS_28)
	@echo '   [Compile] $(BUILD)/obj/options.o'
	$(CC) -c -o $(BUILD)/obj/options.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/options.c

#
#   osdep.o
#
DEPS_29 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/osdep.o: \
    src/osdep.c $(DEPS_29)
	@echo '   [Compile] $(BUILD)/obj/osdep.o'
	$(CC) -c -o $(BUILD)/obj/osdep.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/osdep.c

#
#   rom.o
#
DEPS_30 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/rom.o: \
    src/rom.c $(DEPS_30)
	@echo '   [Compile] $(BUILD)/obj/rom.o'
	$(CC) -c -o $(BUILD)/obj/rom.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/rom.c

#
#   route.o
#
DEPS_31 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/route.o: \
    src/route.c $(DEPS_31)
	@echo '   [Compile] $(BUILD)/obj/route.o'
	$(CC) -c -o $(BUILD)/obj/route.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/route.c

#
#   runtime.o
#
DEPS_32 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/runtime.o: \
    src/runtime.c $(DEPS_32)
	@echo '   [Compile] $(BUILD)/obj/runtime.o'
	$(CC) -c -o $(BUILD)/obj/runtime.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/runtime.c

#
#   socket.o
#
DEPS_33 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/socket.o: \
    src/socket.c $(DEPS_33)
	@echo '   [Compile] $(BUILD)/obj/socket.o'
	$(CC) -c -o $(BUILD)/obj/socket.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/socket.c

#
#   test.o
#
DEPS_34 += $(BUILD)/inc/goahead.h
DEPS_34 += $(BUILD)/inc/js.h

$(BUILD)/obj/test.o: \
    test/test.c $(DEPS_34)
	@echo '   [Compile] $(BUILD)/obj/test.o'
	$(CC) -c -o $(BUILD)/obj/test.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" test/test.c

#
#   time.o
#
DEPS_35 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/time.o: \
    src/time.c $(DEPS_35)
	@echo '   [Compile] $(BUILD)/obj/time.o'
	$(CC) -c -o $(BUILD)/obj/time.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/time.c

#
#   upload.o
#
DEPS_36 += $(BUILD)/inc/goahead.h

$(BUILD)/obj/upload.o: \
    src/upload.c $(DEPS_36)
	@echo '   [Compile] $(BUILD)/obj/upload.o'
	$(CC) -c -o $(BUILD)/obj/upload.o -arch $(CC_ARCH) $(CFLAGS) $(DFLAGS) -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -DMBEDTLS_USER_CONFIG_FILE=\"embedtls.h\" -DME_COM_OPENSSL_PATH=$(ME_COM_OPENSSL_PATH) $(IFLAGS) "-I$(ME_COM_OPENSSL_PATH)/include" src/upload.c

ifeq ($(ME_COM_MBEDTLS),1)
#
#   libmbedtls
#
DEPS_37 += $(BUILD)/inc/osdep.h
DEPS_37 += $(BUILD)/inc/embedtls.h
DEPS_37 += $(BUILD)/inc/mbedtls.h
DEPS_37 += $(BUILD)/obj/mbedtls.o

$(BUILD)/bin/libmbedtls.a: $(DEPS_37)
	@echo '      [Link] $(BUILD)/bin/libmbedtls.a'
	$(AR) -cr $(BUILD)/bin/libmbedtls.a "$(BUILD)/obj/mbedtls.o"
endif

ifeq ($(ME_COM_MBEDTLS),1)
#
#   libgoahead-mbedtls
#
DEPS_38 += $(BUILD)/bin/libmbedtls.a
DEPS_38 += $(BUILD)/obj/goahead-mbedtls.o

$(BUILD)/bin/libgoahead-mbedtls.a: $(DEPS_38)
	@echo '      [Link] $(BUILD)/bin/libgoahead-mbedtls.a'
	$(AR) -cr $(BUILD)/bin/libgoahead-mbedtls.a "$(BUILD)/obj/goahead-mbedtls.o"
endif

ifeq ($(ME_COM_OPENSSL),1)
#
#   libgoahead-openssl
#
DEPS_39 += $(BUILD)/obj/goahead-openssl.o

$(BUILD)/bin/libgoahead-openssl.a: $(DEPS_39)
	@echo '      [Link] $(BUILD)/bin/libgoahead-openssl.a'
	$(AR) -cr $(BUILD)/bin/libgoahead-openssl.a "$(BUILD)/obj/goahead-openssl.o"
endif

#
#   libgo
#
DEPS_40 += $(BUILD)/inc/osdep.h
ifeq ($(ME_COM_MBEDTLS),1)
    DEPS_40 += $(BUILD)/bin/libgoahead-mbedtls.a
endif
ifeq ($(ME_COM_OPENSSL),1)
    DEPS_40 += $(BUILD)/bin/libgoahead-openssl.a
endif
DEPS_40 += $(BUILD)/inc/goahead.h
DEPS_40 += $(BUILD)/inc/js.h
DEPS_40 += $(BUILD)/obj/action.o
DEPS_40 += $(BUILD)/obj/alloc.o
DEPS_40 += $(BUILD)/obj/auth.o
DEPS_40 += $(BUILD)/obj/cgi.o
DEPS_40 += $(BUILD)/obj/crypt.o
DEPS_40 += $(BUILD)/obj/file.o
DEPS_40 += $(BUILD)/obj/fs.o
DEPS_40 += $(BUILD)/obj/http.o
DEPS_40 += $(BUILD)/obj/js.o
DEPS_40 += $(BUILD)/obj/jst.o
DEPS_40 += $(BUILD)/obj/options.o
DEPS_40 += $(BUILD)/obj/osdep.o
DEPS_40 += $(BUILD)/obj/rom.o
DEPS_40 += $(BUILD)/obj/route.o
DEPS_40 += $(BUILD)/obj/runtime.o
DEPS_40 += $(BUILD)/obj/socket.o
DEPS_40 += $(BUILD)/obj/time.o
DEPS_40 += $(BUILD)/obj/upload.o

$(BUILD)/bin/libgo.a: $(DEPS_40)
	@echo '      [Link] $(BUILD)/bin/libgo.a'
	$(AR) -cr $(BUILD)/bin/libgo.a "$(BUILD)/obj/action.o" "$(BUILD)/obj/alloc.o" "$(BUILD)/obj/auth.o" "$(BUILD)/obj/cgi.o" "$(BUILD)/obj/crypt.o" "$(BUILD)/obj/file.o" "$(BUILD)/obj/fs.o" "$(BUILD)/obj/http.o" "$(BUILD)/obj/js.o" "$(BUILD)/obj/jst.o" "$(BUILD)/obj/options.o" "$(BUILD)/obj/osdep.o" "$(BUILD)/obj/rom.o" "$(BUILD)/obj/route.o" "$(BUILD)/obj/runtime.o" "$(BUILD)/obj/socket.o" "$(BUILD)/obj/time.o" "$(BUILD)/obj/upload.o"

#
#   install-certs
#
DEPS_41 += src/certs/samples/ca.crt
DEPS_41 += src/certs/samples/ca.key
DEPS_41 += src/certs/samples/ec.crt
DEPS_41 += src/certs/samples/ec.key
DEPS_41 += src/certs/samples/roots.crt
DEPS_41 += src/certs/samples/self.crt
DEPS_41 += src/certs/samples/self.key
DEPS_41 += src/certs/samples/test.crt
DEPS_41 += src/certs/samples/test.key

$(BUILD)/.install-certs-modified: $(DEPS_41)
	@echo '      [Copy] $(BUILD)/bin'
	mkdir -p "$(BUILD)/bin"
	cp src/certs/samples/ca.crt $(BUILD)/bin/ca.crt
	cp src/certs/samples/ca.key $(BUILD)/bin/ca.key
	cp src/certs/samples/ec.crt $(BUILD)/bin/ec.crt
	cp src/certs/samples/ec.key $(BUILD)/bin/ec.key
	cp src/certs/samples/roots.crt $(BUILD)/bin/roots.crt
	cp src/certs/samples/self.crt $(BUILD)/bin/self.crt
	cp src/certs/samples/self.key $(BUILD)/bin/self.key
	cp src/certs/samples/test.crt $(BUILD)/bin/test.crt
	cp src/certs/samples/test.key $(BUILD)/bin/test.key
	touch "$(BUILD)/.install-certs-modified"

#
#   goahead
#
DEPS_42 += $(BUILD)/bin/libgo.a
DEPS_42 += $(BUILD)/.install-certs-modified
DEPS_42 += $(BUILD)/inc/goahead.h
DEPS_42 += $(BUILD)/inc/js.h
DEPS_42 += $(BUILD)/obj/goahead.o

ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_42 += -lmbedtls
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_42 += -lgoahead-mbedtls
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_42 += -lmbedtls
endif
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_42 += -lgoahead-openssl
endif
ifeq ($(ME_COM_OPENSSL),1)
ifeq ($(ME_COM_SSL),1)
    LIBS_42 += -lssl
    LIBPATHS_42 += -L"$(ME_COM_OPENSSL_PATH)"
endif
endif
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_42 += -lcrypto
    LIBPATHS_42 += -L"$(ME_COM_OPENSSL_PATH)"
endif
LIBS_42 += -lgo
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_42 += -lgoahead-openssl
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_42 += -lgoahead-mbedtls
endif

$(BUILD)/bin/goahead: $(DEPS_42)
	@echo '      [Link] $(BUILD)/bin/goahead'
	$(CC) -o $(BUILD)/bin/goahead -arch $(CC_ARCH) $(LDFLAGS) $(LIBPATHS)  "$(BUILD)/obj/goahead.o" $(LIBPATHS_42) $(LIBS_42) $(LIBS_42) $(LIBS) 

#
#   goahead-test
#
DEPS_43 += $(BUILD)/bin/libgo.a
DEPS_43 += $(BUILD)/.install-certs-modified
DEPS_43 += $(BUILD)/obj/test.o

ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_43 += -lmbedtls
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_43 += -lgoahead-mbedtls
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_43 += -lmbedtls
endif
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_43 += -lgoahead-openssl
endif
ifeq ($(ME_COM_OPENSSL),1)
ifeq ($(ME_COM_SSL),1)
    LIBS_43 += -lssl
    LIBPATHS_43 += -L"$(ME_COM_OPENSSL_PATH)"
endif
endif
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_43 += -lcrypto
    LIBPATHS_43 += -L"$(ME_COM_OPENSSL_PATH)"
endif
LIBS_43 += -lgo
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_43 += -lgoahead-openssl
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_43 += -lgoahead-mbedtls
endif

$(BUILD)/bin/goahead-test: $(DEPS_43)
	@echo '      [Link] $(BUILD)/bin/goahead-test'
	$(CC) -o $(BUILD)/bin/goahead-test -arch $(CC_ARCH) $(LDFLAGS) $(LIBPATHS)  "$(BUILD)/obj/test.o" $(LIBPATHS_43) $(LIBS_43) $(LIBS_43) $(LIBS) 

#
#   gopass
#
DEPS_44 += $(BUILD)/bin/libgo.a
DEPS_44 += $(BUILD)/inc/goahead.h
DEPS_44 += $(BUILD)/inc/js.h
DEPS_44 += $(BUILD)/obj/gopass.o

ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_44 += -lmbedtls
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_44 += -lgoahead-mbedtls
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_44 += -lmbedtls
endif
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_44 += -lgoahead-openssl
endif
ifeq ($(ME_COM_OPENSSL),1)
ifeq ($(ME_COM_SSL),1)
    LIBS_44 += -lssl
    LIBPATHS_44 += -L"$(ME_COM_OPENSSL_PATH)"
endif
endif
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_44 += -lcrypto
    LIBPATHS_44 += -L"$(ME_COM_OPENSSL_PATH)"
endif
LIBS_44 += -lgo
ifeq ($(ME_COM_OPENSSL),1)
    LIBS_44 += -lgoahead-openssl
endif
ifeq ($(ME_COM_MBEDTLS),1)
    LIBS_44 += -lgoahead-mbedtls
endif

$(BUILD)/bin/gopass: $(DEPS_44)
	@echo '      [Link] $(BUILD)/bin/gopass'
	$(CC) -o $(BUILD)/bin/gopass -arch $(CC_ARCH) $(LDFLAGS) $(LIBPATHS)  "$(BUILD)/obj/gopass.o" $(LIBPATHS_44) $(LIBS_44) $(LIBS_44) $(LIBS) 

#
#   stop
#

stop: $(DEPS_45)

#
#   installBinary
#

installBinary: $(DEPS_46)
	mkdir -p "$(ME_APP_PREFIX)" ; \
	rm -f "$(ME_APP_PREFIX)/latest" ; \
	ln -s "$(VERSION)" "$(ME_APP_PREFIX)/latest" ; \
	mkdir -p "$(ME_MAN_PREFIX)/man1" ; \
	chmod 755 "$(ME_MAN_PREFIX)/man1" ; \
	mkdir -p "$(ME_VAPP_PREFIX)/bin" ; \
	cp $(BUILD)/bin/goahead $(ME_VAPP_PREFIX)/bin/goahead ; \
	chmod 755 "$(ME_VAPP_PREFIX)/bin/goahead" ; \
	mkdir -p "$(ME_BIN_PREFIX)" ; \
	rm -f "$(ME_BIN_PREFIX)/goahead" ; \
	ln -s "$(ME_VAPP_PREFIX)/bin/goahead" "$(ME_BIN_PREFIX)/goahead" ; \
	mkdir -p "$(ME_VAPP_PREFIX)/bin" ; \
	cp $(BUILD)/bin/roots.crt $(ME_VAPP_PREFIX)/bin/roots.crt ; \
	mkdir -p "$(ME_ETC_PREFIX)" ; \
	cp $(BUILD)/bin/self.crt $(ME_ETC_PREFIX)/self.crt ; \
	mkdir -p "$(ME_ETC_PREFIX)" ; \
	cp $(BUILD)/bin/self.key $(ME_ETC_PREFIX)/self.key ; \
	mkdir -p "$(ME_WEB_PREFIX)" ; \
	cp src/web/index.html $(ME_WEB_PREFIX)/index.html ; \
	cp src/web/favicon.ico $(ME_WEB_PREFIX)/favicon.ico ; \
	mkdir -p "$(ME_ETC_PREFIX)" ; \
	cp src/auth.txt $(ME_ETC_PREFIX)/auth.txt ; \
	cp src/route.txt $(ME_ETC_PREFIX)/route.txt ; \
	mkdir -p "$(ME_VAPP_PREFIX)/doc/man/man1" ; \
	cp doc/dist/man/goahead.1 $(ME_VAPP_PREFIX)/doc/man/man1/goahead.1 ; \
	mkdir -p "$(ME_MAN_PREFIX)/man1" ; \
	rm -f "$(ME_MAN_PREFIX)/man1/goahead.1" ; \
	ln -s "$(ME_VAPP_PREFIX)/doc/man/man1/goahead.1" "$(ME_MAN_PREFIX)/man1/goahead.1" ; \
	cp doc/dist/man/gopass.1 $(ME_VAPP_PREFIX)/doc/man/man1/gopass.1 ; \
	mkdir -p "$(ME_MAN_PREFIX)/man1" ; \
	rm -f "$(ME_MAN_PREFIX)/man1/gopass.1" ; \
	ln -s "$(ME_VAPP_PREFIX)/doc/man/man1/gopass.1" "$(ME_MAN_PREFIX)/man1/gopass.1" ; \
	cp doc/dist/man/webcomp.1 $(ME_VAPP_PREFIX)/doc/man/man1/webcomp.1 ; \
	mkdir -p "$(ME_MAN_PREFIX)/man1" ; \
	rm -f "$(ME_MAN_PREFIX)/man1/webcomp.1" ; \
	ln -s "$(ME_VAPP_PREFIX)/doc/man/man1/webcomp.1" "$(ME_MAN_PREFIX)/man1/webcomp.1"

#
#   start
#

start: $(DEPS_47)

#
#   install
#
DEPS_48 += stop
DEPS_48 += installBinary
DEPS_48 += start

install: $(DEPS_48)

#
#   installPrep
#

installPrep: $(DEPS_49)
	if [ "`id -u`" != 0 ] ; \
	then echo "Must run as root. Rerun with sudo." ; \
	exit 255 ; \
	fi

#
#   uninstall
#
DEPS_50 += stop

uninstall: $(DEPS_50)

#
#   uninstallBinary
#

uninstallBinary: $(DEPS_51)
	rm -fr "$(ME_WEB_PREFIX)" ; \
	rm -fr "$(ME_VAPP_PREFIX)" ; \
	rmdir -p "$(ME_ETC_PREFIX)" 2>/dev/null ; true ; \
	rmdir -p "$(ME_WEB_PREFIX)" 2>/dev/null ; true ; \
	rm -f "$(ME_APP_PREFIX)/latest" ; \
	rmdir -p "$(ME_APP_PREFIX)" 2>/dev/null ; true

#
#   version
#

version: $(DEPS_52)
	echo $(VERSION)
