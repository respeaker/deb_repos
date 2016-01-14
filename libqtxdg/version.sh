#!/bin/bash -e

mirror="http://ftp.de.debian.org/debian"

package_name="libqtxdg"
debian_pkg_name="${package_name}"
package_version="1.3.0"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}-${package_version}"

git_repo=""
git_sha=""
reprepro_dir="libq/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-3"
debian_untar="${package_name}_${debian_version}.debian.tar.xz"
debian_patch=""

jessie_version="~bpo80+20151228+1"
stretch_version="~bpo90+20151228+1"
