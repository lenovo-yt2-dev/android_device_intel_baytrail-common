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

BOARD_SEPOLICY_DIRS +=\
        device/aosp4ia/intel_base/baytrail/sepolicy

BOARD_SEPOLICY_REPLACE := \
        domain.te

BOARD_SEPOLICY_UNION +=\
        adbd.te \
        apk_logfs.te \
        bcu_cpufreqrel.te \
        bluetooth.te \
        coreu.te \
        crashlogd.te \
        device.te \
        dhcp.te \
        drmserver.te \
        dumpstate.te \
        ecryptfs.te \
        fg_conf.te \
        file_contexts \
        file.te \
        fs_use \
        genfs_contexts \
        gpsd.te \
        hdcpd.te \
        healthd.te \
        init_shell.te \
        init.te \
        isolated_app.te \
        kernel.te \
        keystore.te \
        mediaserver.te \
        mmgr.te \
        netd.te \
        nvm_server.te \
        platform_app.te \
        radio.te \
        recovery.te \
        rild.te \
        seapp_contexts \
        sensorhubd.te \
        service.te \
        service_contexts \
        servicemanager.te \
        shell.te \
        surfaceflinger.te \
        system_app.te \
        system_server.te \
        thermal.te \
        ueventd.te \
        untrusted_app.te \
        vdc.te \
        vold.te \
        watchdogd.te \
        wlan_prov.te \
        wpa.te \
        zygote.te
