#!/bin/bash -e

#https://github.com/respeaker/upm

package_name="upm"
debian_pkg_name="${package_name}"
package_version="1.5.0-git20171116"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/intel-iot-devkit/upm"
git_sha="18b8ca26335186c6ea0ae2abf06476938917ecab"
reprepro_dir="u/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="re2"

stretch_version="~re2+20171116+1"
