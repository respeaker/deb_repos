#!/bin/bash -e

package_name="respeaker-osconfig"
debian_pkg_name="${package_name}"
package_version="2017.11.15"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="re/${package_name}"
dl_path=""

debian_version="${package_version}"
debian_untar=""
debian_patch=""

stretch_version="~re+20171115+1"
