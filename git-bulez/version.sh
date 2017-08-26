#!/bin/bash -e

#https://kernel.googlesource.com/pub/scm/bluetooth/bluez.git

package_name="bluez"
debian_pkg_name="${package_name}"
package_version="5.46"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="git://git.kernel.org/pub/scm/bluetooth/bluez.git"
git_sha="c8c680e14a2f299fe1825c6981edcdbe131cf2fd"
reprepro_dir="c/${package_name}"
dl_path=""

debian_version="${package_version}-0rcnee0"
debian_patch=""
debian_diff=""

stretch_version="~re+20170825"
