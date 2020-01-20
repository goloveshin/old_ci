LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c \
    lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c \
    ltm.c lundump.c lvm.c lzio.c \
    lauxlib.c lbaselib.c lbitlib.c lcorolib.c ldblib.c liolib.c \
    lmathlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c loadlib.c linit.c

LOCAL_CFLAGS += -std=gnu99 -DLUA_USE_POSIX -DLUA_USE_DLOPEN
LOCAL_MODULE := liblua
LOCAL_MODULE_TAGS := optional

include $(BUILD_STATIC_LIBRARY)
