#!/bin/bash -e

#https://github.com/respeaker/up

package_name="upm"
debian_pkg_name="${package_name}"
package_version="1.3.0-git20170923"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="https://github.com/respeaker/upm"
git_sha="90ee0f1de9c2c8e561407a01469aa4cae1cd6f4f"
reprepro_dir="u/${package_name}"
dl_path=""

debian_version="${package_version}-0"
debian_patch=""
debian_diff=""
local_patch="re2"

stretch_version="~re2+20170923+1"
