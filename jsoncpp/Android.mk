LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	json_reader.cpp \
	json_value.cpp \
	json_writer.cpp

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src/lib_json

LOCAL_CFLAGS := -DJSONCPP_NO_LOCALE_SUPPORT=1
#	-DJSON_USE_EXCEPTION=0

LOCAL_MODULE := \
	libjsoncpp_taiga

include taiga/build/stl_static.mk
include $(BUILD_STATIC_LIBRARY)
