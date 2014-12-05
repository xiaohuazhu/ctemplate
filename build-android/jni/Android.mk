LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

src_files = \
  htmlparser/htmlparser.cc \
  htmlparser/jsparser.cc \
  htmlparser/statemachine.cc \
  base/arena.cc \
  per_expand_data.cc \
  template.cc            template_dictionary.cc template_pathops.cc \
  template_annotator.cc  template_modifiers.cc  template_string.cc \
  template_cache.cc      template_namelist.cc

src_dir := $(LOCAL_PATH)/../../src

NDK_TOOLCHAIN_VERSION := clang
#LOCAL_CPPFLAGS += -stdlib=libstdc++
LOCAL_C_INCLUDES := $(src_dir)/../build-android/include $(src_dir) \
  $(ANDROID_NDK)/sources/cxx-stl/llvm-libc++/libcxx/include \
  $(ANDROID_NDK)/sources/android/support/include
LOCAL_MODULE := ctemplate
LOCAL_SRC_FILES := $(addprefix $(src_dir)/, $(src_files))
#LOCAL_LDLIBS += -L$(ANDROID_NDK)/sources/cxx-stl/llvm-libc++/libs/$(TARGET_ARCH_ABI) -lc++_shared

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)
