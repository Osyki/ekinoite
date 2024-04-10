# Kinoite-Ekyso

This is a custom image based on [UBlue OS](https://github.com/ublue-os) with NVidia image. It includes the following changes:

### Installed Applications:
- Virt-manager (layered)
- LibreOffice (layered)
- VSCode (layered)
- Steam layered (layered)
  - Fixed download speeds
  - Steam-devices installed
- Discord (flatpak)
- Spotify (flatpak)
- Firefox (flatpak)
- LibreWolf (flatpak)
- Vinegar (flatpak)
- Zoom (flatpak)
- Boxes (flatpak)
- BoxBuddy (flatpak)
- Lutris (flatpak)
- Plex (flatpak)
- Hyperbeam (AppImage)
- Balena Etcher (AppImage)

### KDE Plasma:
- Changed the default theme to Breeze Dark
- 4 virtual desktops
- Meta key opens KRunner

### System:
- Disable noveau drivers
- Fonts:
  - JetBrains Mono
  - Lilex
  - FiraCode

---
## Installation

### To build the ISO:

> [Podman](https://podman.io/docs/installation) is required to build the image.

- Fork this repository
- Change to the build_iso directory:
  ```
  cd build_iso
  ```
- Run the build script:
  ```
  ./build_iso.sh
  ```
- The ISO will be created in working directory

### To rebase an existing atomic Fedora installation to the latest build:

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

- First pin your current ostree image to make sure you can rollback:
  ```
  sudo ostree pin <index: number>
  ```
- Then remove all layered packages to prepare for rebase:
  ```
  rpm-ostree reset
  ```
- Then rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/osyki/kinoite-ekyso:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/osyki/kinoite-ekyso:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
---
## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/osyki/ekinoite
```
---
## BlueBuild Template &nbsp; [![build-ublue](https://github.com/blue-build/template/actions/workflows/build.yml/badge.svg)](https://github.com/blue-build/template/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.