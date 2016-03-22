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
        device/aosp4ia/intel_base/sepolicy

BOARD_SEPOLICY_UNION +=\
        asf.te \
        file_contexts \
        genfs_contexts \
        intel_prop.te \
        platform_app.te \
        service_contexts \
        service.te \
        system_app.te
