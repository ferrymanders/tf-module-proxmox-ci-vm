# tf-module-proxmox-ci-vm


```
module "ubuntu-vm" {
  source                = "git::https://github.com/ferrymanders/tf-module-proxmox-ci-vm.git?ref=v1.0"

  vmid                  = 100
  name                  = "ubuntu-vm"
  node                  = "proxmox-node-1"

  ci_user               = "username"
  ci_sshkey             = "rsa AABG....cxz="

  disks = [
    {
      size     = "32G"
      type     = "scsi"
      storage  = "local-lvm"
      iothread = 1
    },
    {
      size     = "16G"
      type     = "scsi"
      storage  = "local-lvm"
      iothread = 1
    },
  ]

  net_ip                = "192.168.1.101"
  net_gw                = "192.168.1.1"
  net_subnet            = "/24"
  #net_tag               = "10"

  os_template           = "ubuntu-2204-cloudinit"
}
```