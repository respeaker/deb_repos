#!/bin/bash -e

#https://github.com/Seeed-Studio/grove.py

package_name="grove-py"
debian_pkg_name="${package_name}"
package_version="0.5-git20181011"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/Seeed-Studio/grove.py"
git_sha="9ee8715511193aff24b613ba8d26f5105930bd3b"
reprepro_dir="g/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="0pi"

stretch_version="20181011"
