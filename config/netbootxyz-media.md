<div align='center'>
    <a href='https://netboot.xyz/' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/netboot.png' alt='Logo' style='width:150px;height:100px;'/>
    </a>

<h2 style='font-size: 24px; margin: 20px 0;'>Netboot.xyz VM</h2>

<span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/netbootxyz/docker-netbootxyz' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
</span>
<span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://netboot.xyz/docs' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Documentation</a>
</span>
<span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://netboot.xyz/blog' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Blog</a>
</span>
</div>

---

# Vanir Media Container
- VMID: 100
- OS: debian-13
- Created via: Proxmox VM
- Notes:
  - Purpose: Netboot.XYZ PXE Boot for home network served via docker
  - Storage: local-lvm
  - Network: static IP bind via DHCP

## Raw Proxmox Config
- arch: amd64
- cores: 1
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-netboot
- memory: 2048
- net0: name=eth0,bridge=vmbr0,hwaddr=aa:bb:cc:dd:ee:ff,ip=dhcp,type=veth
- ostype: debian
- rootfs: local-lvm:vm-*-disk-0,size=32G
- swap: 512
- tags: PXE,netboot
- unprivileged: 1