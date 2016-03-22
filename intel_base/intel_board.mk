#
# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#==============================================================================#
# Architecture :
#==============================================================================#
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
  TARGET_ARCH := x86_64
  TARGET_CPU_ABI := x86_64
  TARGET_ARCH_VARIANT := silvermont
  TARGET_2ND_CPU_ABI := x86
  TARGET_2ND_ARCH := x86
  TARGET_2ND_ARCH_VARIANT := silvermont
else
  TARGET_ARCH := x86
  TARGET_ARCH_VARIANT ?= x86-atom
  TARGET_CPU_ABI := x86
endif
TARGET_CPU_SMP := true
TARGET_PRELINK_MODULE := false

# Install Native Bridge
ifeq ($(WITH_NATIVE_BRIDGE),true)

# Enable ARM codegen for x86 with Native Bridge
BUILD_ARM_FOR_X86 := true

# Native Bridge ABI List
NB_ABI_LIST_32_BIT := armeabi-v7a armeabi
# NB_ABI_LIST_64_BIT := arm64-v8a

# Support 64 Bit Apps
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
  TARGET_CPU_ABI_LIST_64_BIT ?= $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
  ifeq ($(TARGET_SUPPORTS_32_BIT_APPS),true)
    TARGET_CPU_ABI_LIST_32_BIT ?= $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2)
  endif
  ifneq ($(findstring ro.zygote=zygote32_64,$(PRODUCT_DEFAULT_PROPERTY_OVERRIDES)),)
    TARGET_CPU_ABI_LIST := \
        $(TARGET_CPU_ABI_LIST_32_BIT) \
        $(TARGET_CPU_ABI_LIST_64_BIT) \
        $(NB_ABI_LIST_32_BIT) \
        $(NB_ABI_LIST_64_BIT)
    TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
  else
    ifeq ($(TARGET_SUPPORTS_32_BIT_APPS),true)
      TARGET_CPU_ABI_LIST := \
          $(TARGET_CPU_ABI_LIST_64_BIT) \
          $(TARGET_CPU_ABI_LIST_32_BIT) \
          $(NB_ABI_LIST_32_BIT) \
          $(NB_ABI_LIST_64_BIT)
      TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
    else
      TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT) $(NB_ABI_LIST_64_BIT)
    endif
  endif
  TARGET_CPU_ABI_LIST_64_BIT += $(NB_ABI_LIST_64_BIT)
  ADDITIONAL_BUILD_PROPERTIES += ro.dalvik.vm.isa.arm64=x86_64 ro.enable.native.bridge.exec64=1
else
  TARGET_CPU_ABI_LIST_32_BIT ?= $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
  TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
  TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_32_BIT)
  ADDITIONAL_BUILD_PROPERTIES += ro.dalvik.vm.isa.arm=x86 ro.enable.native.bridge.exec=1
endif
ADDITIONAL_DEFAULT_PROPERTIES += ro.dalvik.vm.native.bridge=libhoudini.so

# Appends path to ARM libs for Houdini
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/arm

endif

#==============================================================================#

INTEL_INGREDIENTS_VERSIONS := true

# Skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR := false

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true
# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Enable dex-preoptimization to speed up the first boot sequence
# Note that this operation only works on Linux for now
# Enable for non-eng builds
ifneq ($(TARGET_BUILD_VARIANT),eng)
WITH_DEXPREOPT := true
endif

# SELinux Policy : Intel
-include device/aosp4ia/intel_base/intel_sepolicy.mk
