# shellcheck shell=bash

repo_dir() {
	repo="$1"

	repo_dir=$(basename "$repo")
	# Remove .git extension
	repo_dir=${repo_dir/.git/}

	echo "$repo_dir"
}

latest_git_tag() {
	git tag -l | sort -V | tail -n1
}

clone_or_update_git_repo_latest_tag() {
	url="$1"

	# Must clone first, to make sure it exists
	clone_or_update_git_repo "$url"

	repo_dir=$(repo_dir "$url")
	pushd $repo_dir
	latest_tag=$(latest_git_tag)
	popd

	clone_or_update_git_repo "$url" "$latest_tag"
}

update_git_submodules() {
	optional_submodule="$1"
	git submodule sync
	git submodule update --init --recursive $optional_submodule
}

is_git_tag() {
	git tag -l | grep -q "$1"
}

# This assums that the repo doesn't contain the .repo extension
clone_or_update_git_repo() {
	repo=$1

	if [ -n "$2" ]; then
		revision="$2"
	else
		revision="master"
	fi

	if [ -n "$3" ]; then
		repo_dir=$3
	else
		repo_dir=$(repo_dir "$repo")
	fi

	echo "Cloning or updating repo: $repo"

	if [ ! -e "$repo_dir" ]; then
		git clone "$repo" "$repo_dir"
		pushd "$repo_dir"
		git config user.name "Wade Berrier"
		git config user.email "wberrier@gmail.com"
		popd
	else
		pushd "$repo_dir"
		# Only fetch
		git fetch -pa
		popd
	fi

	pushd "$repo_dir"
	git checkout "$revision"

	# Only pull on a branch
	if ! is_git_tag "$revision"; then
		git pull
	fi

	# handle any submodules
	update_git_submodules
	popd
}

clone_or_update_mercurial_repo() {
	repo=$1

	repo_dir=$(basename "$repo")

	echo "Cloning or updating repo: $repo"

	if [ ! -e "$repo_dir" ]; then
		hg clone "$repo"

		# Set username for these repos (usually public)
		echo '[ui]' >>"$repo_dir/.hg/hgrc"
		echo 'username = Wade Berrier <wberrier@gmail.com>' >>"$repo_dir/.hg/hgrc"

	else
		pushd "$repo_dir"
		hg pull
		hg update
		popd
	fi
}
