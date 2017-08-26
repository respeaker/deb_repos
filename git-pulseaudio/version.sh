#!/bin/bash -e

#https://anongit.freedesktop.org/git/pulseaudio/pulseaudio.git

package_name="pulseaudio"
debian_pkg_name="${package_name}"
package_version="10.99.1-7-g6921e"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="git://anongit.freedesktop.org/pulseaudio/pulseaudio"
git_sha="6921e08f605bbe7c1e2c2fc1afe35c1202239627"
reprepro_dir="p/${package_name}"
dl_path=""

debian_version="${package_version}-0respeaker"
debian_untar=""
debian_patch=""

stretch_version="~re+20170825+1"
