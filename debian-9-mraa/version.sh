#!/bin/bash -e

#https://github.com/respeaker/mraa

package_name="mraa"
debian_pkg_name="${package_name}"
package_version="1.9.0-git20180813"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/respeaker/mraa"
git_sha="ce748f6b2fedbe5e979e1bb36beac94c752ba23f"
reprepro_dir="libm/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="0pi"

stretch_version="20180813"
