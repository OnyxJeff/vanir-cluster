<div align='center'>
    <a href='https://Helper-Scripts.com' target='_blank' rel='noopener noreferrer'>
    <img src='https://raw.githubusercontent.com/onyxjeff/vanir-cluster/main/images/pathfinder-2e.png' alt='Logo' style='width:174px;height:112px;'/>
    </a>

<h2 style='font-size: 24px; margin: 20px 0;'>Pf2eTools LXC</h2>

<p style='margin: 16px 0;'>
    <a href='https://ko-fi.com/community_scripts' target='_blank' rel='noopener noreferrer'>
    <img src='https://img.shields.io/badge/&#x2615;-Buy us a coffee-blue' alt='spend Coffee' />
    </a>
</p>

<span style='margin: 0 10px;'>
    <i class="fa fa-github fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>GitHub</a>
</span>
<span style='margin: 0 10px;'>
    <i class="fa fa-comments fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/discussions' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Discussions</a>
</span>
<span style='margin: 0 10px;'>
    <i class="fa fa-exclamation-circle fa-fw" style="color: #f5f5f5;"></i>
    <a href='https://github.com/community-scripts/ProxmoxVE/issues' target='_blank' rel='noopener noreferrer' style='text-decoration: none; color: #00617f;'>Issues</a>
</span>
</div>

---

# Vanir Media Container
- CTID: 100
- OS: debian-12
- Created via: Proxmox Helper Scripts
- Notes:
  - Purpose: Pathfinder 2nd Edition Tools/Wiki
  - Storage: local-lvm
  - Network: static IP bind via DHCP

## Raw Proxmox Config
- arch: amd64
- cores: 1
- features: keyctl=1,nesting=1,fuse=1
- hostname: hml-pf2etools
- memory: 512
- net0: name=eth0,bridge=vmbr0,hwaddr=BC:24:11:B6:AF:A1,ip=dhcp,type=veth
- onboot: 1
- ostype: debian
- rootfs: local-lvm:vm-4010403-disk-0,size=6G
- swap: 512
- tags: community-script;wiki
- unprivileged: 1