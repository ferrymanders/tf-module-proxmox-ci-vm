resource "proxmox_vm_qemu" "proxmox_vm" {
  vmid              = var.vmid
  name              = var.name
  target_node       = var.node

  clone             = var.os_template
  os_type           = var.os_type

  ciuser            = var.ci_user

  cores             = var.vm_cores
  sockets           = var.vm_sockets
  cpu               = var.vm_cputype
  memory            = var.vm_memory

  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"

  dynamic "disk" {
    for_each = var.disks
    content {
      size          = lookup(disk.value, "size", null)
      type          = lookup(disk.value, "type", null)
      storage       = lookup(disk.value, "storage", null)
      iothread      = lookup(disk.value, "iothread", null)
    }
  }

  network {
      model           = "virtio"
      bridge          = "vmbr0"
      tag             = var.net_tag
    }

  # Cloud Init Settings
  ipconfig0 = "ip=${var.net_ip}${var.net_subnet},gw=${var.net_gw}"
  sshkeys = <<EOF
    ${var.ci_sshkey}
    EOF
}