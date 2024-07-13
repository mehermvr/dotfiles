# i need either ubuntu or arch. trying to write something that can handle both without fuss
#
# Detect the Linux distribution
if [ -f /etc/os-release ]; then
	source /etc/os-release
	DISTRO="$ID"
elif [ -f /etc/lsb-release ]; then
	source /etc/lsb-release
	DISTRO="$DISTRIB_ID"
else
	echo "Unsupported distribution"
	exit 1
fi

# Define the install_package function based on the detected distribution
if [ "$DISTRO" = "ubuntu" ] || [ "$DISTRO" = "debian" ]; then
	install_package() {
		sudo apt update
		sudo apt install -y --no-install-recommends "$@"
	}
elif [ "$DISTRO" = "arch" ]; then
	install_package() {
		sudo pacman -Syu
		sudo pacman -S "$@"
	}
else
	echo "Unsupported distribution: $DISTRO"
	exit 1
fi

# because now it'll get messy with trying to handle both ubuntu and arch. especiaaallly with stuff like kitty and nvim, we split off. i'll handle arch later when i need it
if [ "$DISTRO" = "arch" ]; then
	echo "Unsupported distribution: $DISTRO"
	exit 1
fi
