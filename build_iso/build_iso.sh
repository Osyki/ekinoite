# example image details:
IMAGE_REPO=ghcr.io/osyki
IMAGE_NAME=ekinoite
IMAGE_TAG=latest
IMAGE_VARIANT=Kinoite # should match the variant your image is based on
# example installer details:
INSTALLER_VERSION=39
# iso command:
sudo podman run --rm --privileged --volume .:/isogenerator/output --security-opt label=disable --pull=newer \
-e IMAGE_REPO="$IMAGE_REPO" -e IMAGE_NAME="$IMAGE_NAME" -e IMAGE_TAG="$IMAGE_TAG" -e VARIANT="$IMAGE_VARIANT" \
ghcr.io/ublue-os/isogenerator:$INSTALLER_VERSION