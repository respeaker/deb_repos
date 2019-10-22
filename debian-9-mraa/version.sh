#!/bin/bash -e

#https://github.com/respeaker/mraa

package_name="mraa"
debian_pkg_name="${package_name}"
package_version="1.9.0-git20191021"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="-b v1.9.0-grove.py https://github.com/respeaker/mraa"
git_sha="v1.9.0-grove.py"
reprepro_dir="libm/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="0pi"

stretch_version="20191021"
