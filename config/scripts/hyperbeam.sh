#!/usr/bin/env bash
set -euo pipefail

# if appimages directory does not exist, create it
[ -d /appimages ] || mkdir -p /usr/share/appimages

# download and install Hyperbeam
wget https://cdn.hyperbeam.com/Hyperbeam-0.21.0.AppImage -O /usr/share/appimages/Hyperbeam.AppImage

chmod +x /usr/share/appimages/Hyperbeam.AppImage

cat <<EOF >/usr/share/applications/hyperbeam.desktop
[Desktop Entry]
Name=Hyperbeam
Exec=/usr/share/appimages/Hyperbeam.AppImage
Terminal=false
Type=Application
Icon=hyperbeam
Categories=Utility;Application;
EOF

# End of hyperbeam.sh
