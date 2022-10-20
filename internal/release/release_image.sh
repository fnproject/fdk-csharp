#!/usr/bin/env bash
#
# Copyright (c) 2019, 2020 Oracle and/or its affiliates. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -xeuo pipefail
set -ex

if [ -z "$1" ];then
  echo "Please supply dotnet runtime version as argument to release image." >> /dev/stderr
  exit 2
fi

# Release base fdk build and runtime images
dotnetversion=$1
user="fnproject"
image="dotnet"

echo "Pushing release images for dotnet Runtime Version ${dotnetversion}"

./regctl image copy ${OCIR_REGION}/${OCIR_LOC}/dotnet:${dotnetversion}-${BUILD_VERSION}-dev ${user}/${image}:${dotnetversion}-${BUILD_VERSION}-dev
./regctl image copy ${OCIR_REGION}/${OCIR_LOC}/dotnet:${dotnetversion}-${BUILD_VERSION} ${user}/${image}:${dotnetversion}-${BUILD_VERSION}