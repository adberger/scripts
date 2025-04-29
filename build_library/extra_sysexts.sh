EXTRA_SYSEXTS=(
  "zfs|sys-fs/zfs"
  "podman|app-containers/podman,net-misc/passt"
  "python|dev-lang/python,dev-python/pip"
  "nvidia-drivers-535|x11-drivers/nvidia-drivers:0/535|-kernel-open persistenced|amd64"
  "nvidia-drivers-535-open|x11-drivers/nvidia-drivers:0/535|kernel-open persistenced|amd64"
  "nvidia-drivers-550|x11-drivers/nvidia-drivers:0/550|-kernel-open persistenced|amd64"
  "nvidia-drivers-550-open|x11-drivers/nvidia-drivers:0/550|kernel-open persistenced|amd64"
  "nvidia-drivers-570|x11-drivers/nvidia-drivers:0/570|-kernel-open persistenced|amd64"
  "nvidia-drivers-570-open|x11-drivers/nvidia-drivers:0/570|kernel-open persistenced|amd64"
)

_get_unversioned_sysext_packages_unsorted() {
  for sysext in "${EXTRA_SYSEXTS[@]}"; do
    IFS="|" read -r SYSEXT_NAME PACKAGE_ATOMS USEFLAGS < <(echo "$sysext");

    IFS=,
    for atom in $PACKAGE_ATOMS; do
       qatom $atom -F "%{CATEGORY}/%{PN}"
    done
    unset IFS
  done
}

get_unversioned_sysext_packages() {
  _get_unversioned_sysext_packages_unsorted | sort | uniq
}
