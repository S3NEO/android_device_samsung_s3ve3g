RIL_PATH := $(call my-dir)

ifeq ($(BOARD_PROVIDES_LIBRIL),true)
include $(call first-makefiles-under,$(RIL_PATH))
endif
