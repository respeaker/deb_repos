#!/bin/bash -e

#https://github.com/respeaker/upm

package_name="upm"
debian_pkg_name="${package_name}"
package_version="1.6.0-git20180813"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/intel-iot-devkit/upm"
git_sha="9a959b578cb69a5f0766f415da640bcbd3ebabb1"
reprepro_dir="u/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="0pi"

stretch_version="20180813"
