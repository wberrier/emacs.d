# shellcheck shell=bash
# Intended to be included to provide common functionality

#
# Returns a string containing the current Linux distribution
#
get_dist()
{
	dist="nodist"
	if [ -e /etc/fedora-release ]; then
		dist=$(cat /etc/fedora-release | sed -e "s/.*release\s\([0-9]\+\).*/fc\1/")
	elif [ -e /etc/redhat-release ]; then
		dist=$(cat /etc/redhat-release | sed -e "s/.*release\s\([0-9]\+\).*/el\1/")
	elif [ -e /etc/debian_version ]; then
		# TODO: does this work on olders versions than debian 10?
		dist=$(cat /etc/debian_version | sed -e "s/\([0-9]\+\).*/Debian-\1/")
	elif [ -e /etc/lsb-release ]; then
		id=$(grep DISTRIB_ID /etc/lsb-release | awk -F'=' '{print $2}')
		release=$(grep DISTRIB_RELEASE /etc/lsb-release | awk -F'=' '{print $2}')
		dist="${id}-${release}"
	fi

	arch=$(uname -m)

	# TODO: combine i[356]86?

	echo "$dist-$arch"
}

package_system() {
	case $(get_dist) in
		fc*|el*)
			echo "rpm"
			;;
		Debian*|Ubuntu*)
			echo "dpkg"
			;;
		*)
			echo "UNSUPPORTED"
			;;
	esac
}

install_packages() {
	case $(package_system) in
		rpm)
			# el7 uses yum still... don't refer to dnf...
			sudo yum install -y --best --allowerasing "$@"
			;;
		dpkg)
			sudo apt-get update
			sudo apt-get install -y "$@"
			;;
		*)
			echo "unsupported platform"
			;;
	esac
}

remove_packages() {
	case $(package_system) in
		rpm)
			sudo yum remove -y "$@"
			;;
		dpkg)
			sudo apt-get remove --purge -y "$@"
			;;
		*)
			echo "unsupported platform"
			;;
	esac
}

list_package_contents() {
	case $(package_system) in
		rpm)
			rpm -ql "$@"
			;;
		dpkg)
			dpkg -L "$@"
			;;
		*)
			echo "unsupported platform"
			;;
	esac
}

package_installed()
{
	case $(package_system) in
		rpm)
			rpm -q "$1" > /dev/null
			;;
		dpkg)
			dpkg -s "$1" 2>/dev/null | grep Status: | grep -q installed
			;;
		*)
			echo "unsupported platform"
			false
			;;
	esac
}

package_version()
{
	case $(package_system) in
	rpm)
		if version=$(rpm -q "$1" --queryformat "%{VERSION}\n") ; then
			echo "$version"
		else
			echo "0"
			false
		fi
		;;
	dpkg)
		if version=$(dpkg-query --showformat='${source:Upstream-Version}\n' --show "$1" 2>/dev/null) ; then
			echo "$version"
		else
			echo "0"
			false
		fi
		;;
	*)
		echo "unsupported platform"
		false
		;;
	esac
}

install_rpm_from_url_if_not_installed()
{
	url="$1"
	rpm_name="$2"

	if ! package_installed "$rpm_name" ; then
		install_packages "$url"
	else
		echo "$2 already installed"
	fi
}

install_python_packages()
{
	pip_args=""
	case $(get_dist) in
		# Looks like debian patches pip to required this option?
		Debian*|Ubuntu*)
			pip_args="--break-system-packages"
			;;
	esac

	pip3 install --user $pip_args "$@"
}

flatpak_package_installed()
{
	type flatpak > /dev/null 2>&1 && flatpak info "$1" > /dev/null 2>&1
}

install_flatpaks()
{
	# NOTE: running on debian seemed to require sudo
	# Not sure if there's an alternative?
	sudo flatpak install -y --noninteractive --system "$@"
}
