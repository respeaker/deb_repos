#!/bin/bash -e

#https://github.com/Seeed-Studio/grove.py

package_name="grove-py"
debian_pkg_name="${package_name}"
package_version="0.4-git20180830"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/Seeed-Studio/grove.py"
git_sha="3514ab3dc02424daa5cdb63b1b168e684d2f408b"
reprepro_dir="g/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="0pi"

stretch_version="20180830"
