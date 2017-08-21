#!/bin/bash -e

mirror="http://ports.ubuntu.com"

package_name="tightvnc"
debian_pkg_name="${package_name}"
package_version="1.3.10"
package_source="${package_name}_${package_version}.orig.tar.bz2"
#src_dir="${package_name}_${package_version}"
src_dir=vnc_unixsrc

git_repo=""
git_sha=""
reprepro_dir="t/${package_name}"
dl_path="pool/universe/${reprepro_dir}/"

debian_version="${package_version}-0ubuntu3"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""
local_patch="respeaker2"

jessie_version="~80+20170821+1"
