#!/bin/bash -e

#https://anongit.freedesktop.org/git/pulseaudio/pulseaudio.git

package_name="pulseaudio"
debian_pkg_name="${package_name}"
package_version="11.0.1"
package_source="${package_name}_${package_version}.orig.tar.xz"
src_dir="${package_name}_${package_version}"

git_repo="git://anongit.freedesktop.org/pulseaudio/pulseaudio"
git_sha="24928d6b6fa1cde3312bcf63e4e14d7003aadc69"
reprepro_dir="p/${package_name}"
dl_path=""

debian_version="${package_version}-0respeaker"
debian_untar=""
debian_patch=""

stretch_version="~re+20170912+1"
