#!/bin/bash -e

#https://launchpad.net/~webupd8team/+archive/ubuntu/java/+packages

#wget https://launchpad.net/~webupd8team/+archive/ubuntu/java/+files/oracle-java8-installer_8u74+8u73arm-1~webupd8~1.tar.xz

package_name="oracle-java8-installer"
debian_pkg_name="${package_name}"
package_version="8u74+8u73arm"
package_source=""
src_dir=""

git_repo=""
git_sha=""
reprepro_dir="o/${package_name}"
dl_path="pool/main/${reprepro_dir}/"

debian_version="${package_version}-1"
debian_untar=""
debian_patch=""
local_patch="rcnee1"

wheezy_version="~bpo70+20160322+1"
jessie_version="~bpo80+20160322+1"
stretch_version="~bpo90+20160322+1"
trusty_version="~bpo1404+20160322+1"
wily_version="~bpo1510+20160322+1"
xenial_version="~bpo1604+20160322+1"
