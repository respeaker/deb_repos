#!/bin/bash
# tary, 2019/04/08
# v0.1 Initial version
# set -x

name=$(basename $0)
dist=${1:-stretch}
deb_input_path=${2:-$HOME/packages/}

# remote_url=https://seeed-studio.github.io/st_repo
remote_url=`pwd`
aptly_mirror=${dist}-main
aptly_repo=st_repo

name=${name/%.sh/}
logf=$HOME/${name}.txt

function usage() {
	cat <<-EOF
	Usage:
	  $0 [dist] [deb-dir]
	          dist   : default to stretch
	          deb-dir: deb packages path, default to \$HOME/packages
	EOF
}


################################################# check & preparation ##############################
if [ ! -d .git -o ! -d dists/$dist ]; then
	echo "script must run in a deb repo with git cloned repository" | tee -a ${logf}
	usage
	exit 1
fi

changes=`git status -s | wc -l`
[ "$changes" -eq 0 ] || {
	echo "You local deb repo have changes"
	git status -s
	exit 2
}

# update local firstly
# git stash save -u
# git stash clear
git pull origin master; r=$?
[ "$r" -eq 0 ] || {
	echo "Update deb repo (git pull) failed"
	exit 3
}

if ! which aptly > /dev/null; then
	sudo apt-get install aptly
fi

#pushd ~/.gnupg/keys > /dev/null
#gpg --import public.key signing.key
#popd > /dev/null

# import public key
if ! gpg --no-default-keyring --keyring trustedkeys.gpg -k | grep "respeaker" > /dev/null; then
	wget -O - $remote_url/public.key | gpg --no-default-keyring --keyring trustedkeys.gpg --import
fi

# Create the mirror XXX-main
if ! aptly mirror show $aptly_mirror > /dev/null; then
	aptly mirror create $aptly_mirror $remote_url $dist main
fi

if ! aptly repo show $aptly_repo > /dev/null; then
	# Create a empty repo
	aptly repo create $aptly_repo
fi

_aptly_add=`aptly repo add $aptly_repo $deb_input_path`
added=`echo ${_aptly_add} | grep -c added`

if [[ "${added}" == 0 ]] ; then
	echo "$(date), ${name}: added 0 debs" | tee -a ${logf}
	exit 0
fi


####################################### merge and publish ##########################################
echo "$(date), ${name}: added ${added} debs" | tee -a ${logf}

new_pkgs_snap_name=${aptly_repo}-snap-$(date +%Y%m%d%H%M%S)
aptly snapshot create ${new_pkgs_snap_name} from repo $aptly_repo

aptly mirror update $aptly_mirror
mirror_snap_name=pi-mirror-snap-$(date +%Y%m%d%H%M%S)
aptly snapshot create ${mirror_snap_name} from mirror $aptly_mirror

# merge $aptly_repo to mirror snapshot
merged_snap_name=pi-merged-snap-$(date +%Y%m%d%H%M%S)
aptly snapshot merge ${merged_snap_name} ${mirror_snap_name} ${new_pkgs_snap_name}

# clear exist publish
function clear_publish() {
	rm -f ~/.aptly/public/${aptly_repo}
	aptly publish drop ${dist} :${aptly_repo}
}
clear_publish

ln -s `pwd` ~/.aptly/public/${aptly_repo}
aptly publish snapshot -batch -force-overwrite=true -distribution="$dist" -gpg-key="BB8F40F3" \
  -label="main" -origin="$dist"  ${merged_snap_name} :${aptly_repo}
# aptly publish switch -passphrase="XXXX" -skip-cleanup $dist :${aptly_repo} ${merged_snap_name}
r=$?

[ "$r" -eq 0 ] || {
	echo "Merge ${merged_snap_name} failed, please check settings and try again!"
	exit $r
}


###################################### successful cleanup ##########################################
_commit_log=`mktemp`
git add --all
{
	echo "Auto commit from $name"
	echo "" 
	echo ${_aptly_add}
} >> $_commit_log
git commit -F $_commit_log
rm -f $_commit_log
# git push

clear_publish
aptly snapshot drop ${merged_snap_name}
aptly snapshot drop ${mirror_snap_name}
aptly snapshot drop ${new_pkgs_snap_name}

rm -rf $deb_input_path/*.deb

echo "Now, push your git cloned repositary" | tee -a ${logf}
exit 0

