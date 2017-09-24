#!/bin/bash -e

#https://github.com/respeaker/mraa

package_name="mraa"
debian_pkg_name="${package_name}"
package_version="1.8.0-git20170923"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/respeaker/mraa"
git_sha="da7311862ebdb847481bf42361d27252a086017d"
reprepro_dir="libm/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="0re2"

stretch_version="~re2+20170923+1"
