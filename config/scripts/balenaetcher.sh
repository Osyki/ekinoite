#!/usr/bin/env bash
set -euo pipefail

# if appimages directory does not exist, create it
[ -d /appimages ] || mkdir -p /usr/share/appimages

# download and install BalenaEtcher
wget $(wget -q https://api.github.com/repos/balena-io/etcher/releases/latest -O - | jq -r '.assets[] | select(.name | contains("AppImage")) | .browser_download_url') -O /usr/share/appimages/BalenaEtcher.AppImage

chmod +x /usr/share/appimages/BalenaEtcher.AppImage

cat <<EOF >/usr/share/applications/balena-etcher.desktop
[Desktop Entry]
Name=BalenaEtcher
Exec=/usr/share/appimages/BalenaEtcher.AppImage
Terminal=false
Type=Application
Icon=balena-etcher
Categories=Utility;Application;
EOF

# End of balenaetcher.sh
