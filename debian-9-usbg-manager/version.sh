#!/bin/bash -e

package_name="usbg-manager"
debian_pkg_name="${package_name}"
package_version="2017.08.22"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="u/${package_name}"
dl_path=""

debian_version="${package_version}"
debian_untar=""
debian_patch=""

stretch_version="~re+20170822+1"
