LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := imx175_shim.cpp
LOCAL_MODULE := libshim_imx175
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

