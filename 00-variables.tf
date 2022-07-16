variable vmid {}
variable name {}

variable node {}

variable ci_user      { default = null }
variable ci_sshkey    {}

variable vm_cputype   { default = "host" }
variable vm_cores     { default = 2 }
variable vm_sockets   { default = 1 }
variable vm_memory    { default = 8192 }

variable net_ip       {}
variable net_gw       {}
variable net_subnet   { default = "/24" }
variable net_tag      { default = null }

variable "disks" {
  type = list(object({
    size     = string
    type     = string
    storage  = string
    iothread = string
  }))

  description = "List of one or more custom error response element maps"
  default     = [
    {
      size     = "32G"
      type     = "scsi"
      storage  = "local-lvm"
      iothread = 1
    }
  ]
}

variable os_template  {}
variable os_type      { default = "cloud-init" }