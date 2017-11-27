#!/bin/bash -e

#https://git.kernel.org/pub/scm/network/ofono/ofono.git

package_name="ofono"
debian_pkg_name="${package_name}"
package_version="1.21.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="git://git.kernel.org/pub/scm/network/ofono/ofono.git"
git_sha="abe70b50e3fa9726b5e4e993804dac7629071e46"
reprepro_dir="o/${package_name}"
dl_path=""

debian_version="${package_version}-0respeaker"
debian_untar=""
debian_patch=""

stretch_version="~re+20171121+1"
