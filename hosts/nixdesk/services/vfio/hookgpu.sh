#!/run/current-system/sw/bin/bash

# https://github.com/QaidVoid/Complete-Single-GPU-Passthrough
exec 19>/home/xun/desktop/logfile
BASH_XTRACEFD=19
set -x

VIRSH_GPU_VIDEO="pci_0000_09_00_0"
VIRSH_GPU_AUDIO="pci_0000_09_00_1"

if [ ''$1 = "win10" ] || [ ''$1 = "chromeos" ]; then
  if [ ''$2 = "prepare" ] && [ ''$3 = "begin" ]; then
    startGpuHook
  fi

  if [ ''$2 = "release" ] && [ ''$3 = "end" ]; then
    stopGpuHook
  fi
fi


startGpuHook() {
  # Isolate host to core 0
  #systemctl set-property --runtime -- user.slice AllowedCPUs=0
  #systemctl set-property --runtime -- system.slice AllowedCPUs=0
  #systemctl set-property --runtime -- init.scope AllowedCPUs=0

  systemctl stop display-manager

  # Unbind VTconsoles: might not be needed
  echo 0 > /sys/class/vtconsole/vtcon0/bind
  echo 0 > /sys/class/vtconsole/vtcon1/bind

  # Unbind EFI Framebuffer
  echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

  sleep 2

  modprobe -r amdgpu

  virsh nodedev-detach VIRSH_GPU_VIDEO
  virsh nodedev-detach VIRSH_GPU_AUDIO

  modprobe vfio-pci
}

stopGpuHook() {
  modprobe -r vfio-pci

  virsh nodev-reattach VIRSH_GPU_VIDEO
  virsh nodev-reattach VIRSH_GPU_AUDIO

  modprobe amdgpu

  sleep 5

  echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

  echo 1 > /sys/class/vtconsole/vtcon0/bind
  echo 1 > /sys/class/vtconsole/vtcon1/bind

  sleep 1

  systemctl start display-manager

  # Return host to all cores
  #systemctl set-property --runtime -- user.slice AllowedCPUs=0-3
  #systemctl set-property --runtime -- system.slice AllowedCPUs=0-3
  #systemctl set-property --runtime -- init.scope AllowedCPUs=0-3
}
