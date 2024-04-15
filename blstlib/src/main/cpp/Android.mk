########################################################################
# Download/copy[/append?] this file to 'jni[/Android.mk]' directory of
# the *target* application. If https://github.com/supranational/blst is
# not configured as a submodule, the repository will be cloned into the
# 'jni' directory. Either way, it would be appropriate to add following
# lines to your .gitignore:
#
#	[app/]jni/blst*
#	[app/]src/supranational/blst

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := blst

LOCAL_SRC_FILES := blst/src/server.c blst/build/assembly.S blst_wrap.cpp
L_CFLAGS += -Wno-unused-parameter

$(LOCAL_PATH)/blst/src/server.c $(LOCAL_PATH)/blst/build/assembly.S: $(LOCAL_PATH)/blst

$(LOCAL_PATH)/blst_wrap.cpp: $(LOCAL_PATH)/blst/bindings/blst.swg
	blst_classes=`dirname $@`/../java/com/tangem/blstlib/generated && \
	mkdir -p $$blst_classes && \
	swig -c++ -java -package com.tangem.blstlib.generated -outdir $$blst_classes -o $@ $<

LOCAL_CFLAGS := -fno-builtin-memcpy
LOCAL_CPPFLAGS := -fexceptions -I$(LOCAL_PATH)/blst/bindings
LOCAL_LDFLAGS := -Wl,-Bsymbolic

include $(BUILD_SHARED_LIBRARY)