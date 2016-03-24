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

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := silvermont
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_CPU_SMP := true
TARGET_PRELINK_MODULE := false

TARGET_BOARD_PLATFORM := baytrail
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := baytrail
TARGET_USES_64_BIT_BINDER := true
WITH_NATIVE_BRIDGE := true

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Inline kernel building
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage

# Kernel cmdline
BOARD_KERNEL_CMDLINE := loglevel=4 console=logk0 earlyprintk=nologger androidboot.bootmedia=sdcard androidboot.hardware=byt_t_ffrd8 watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 oops=panic panic=40 vmalloc=172M debug_locks=0 bootboost=1 vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor i915.mipi_panel_id=3 androidboot.selinux=permissive

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true

# Hardware Accelerated Graphics
ENABLE_GEN_GRAPHICS := true

# EGL config
BOARD_ALLOW_EGL_HIBERNATION := true

# Select ufo gen7 libs
UFO_ENABLE_GEN := gen7

# Defines Intel library for GPU accelerated Renderscript:
OVERRIDE_RS_DRIVER := libRSDriver_intel7.so

USE_OPENGL_RENDERER := true
USE_INTEL_UFO_DRIVER := true
USE_INTEL_UFO_OPENCL := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
INTEL_VA := true
BOARD_GRAPHIC_IS_GEN := true

INTEL_WIDI := ture
INTEL_WIDI_BAYTRAIL := ture

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Allow HWC to perform a final CSC on virtual displays
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_INTEL_HWCOMPOSER_FORCE_ONLY_ONE_RGB_LAYER := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Audio
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_ALSA_AUDIO := true
BOARD_USES_AUDIO_HAL_XML := true

ifneq (,$(filter $(TARGET_BUILD_VARIANT),eng userdebug))
# Enable ALSA utils for eng and userdebug builds
BUILD_WITH_ALSA_UTILS := true
endif

BOARD_USES_GENERIC_AUDIO := false

# Media
BUILD_WITH_FULL_STAGEFRIGHT := true
INTEL_STAGEFRIGHT := true

INTEL_INGREDIENTS_VERSIONS := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
USE_MEDIASDK := true

# Settings for MPEG4-ASP:
# - USE_SW_MPEG4: use software MPEG4 decoder including ASP support
# - USE_INTEL_IPP: use IPP acceleration in decoders
# - BOARD_USES_WRS_OMXIL_CORE: load WRS omx-il core
# - BOARD_USES_MRST_OMX: load omx-component for MPEG4-ASP
USE_SW_MPEG4 := true
USE_INTEL_IPP := true
USE_INTEL_SECURE_AVC := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true

BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
USE_INTEL_VA := true
INTEL_VA := true

INTEL_INGREDIENTS_VERSIONS := true

# Enable Minikin text layout engine
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Dex-preoptimization: Speeds up initial boot (if we ever do a user build, which we don't)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Security
BUILD_WITH_CHAABI_SUPPORT := true
BUILD_WITH_WATCHDOG_DAEMON_SUPPORT := true
