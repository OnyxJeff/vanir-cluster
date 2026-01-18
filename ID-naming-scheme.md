# Proxmox CT/VM ID Naming Scheme

This document explains the **5-digit ID scheme** used for all my containers (CTs) and virtual machines (VMs) in my Proxmox clusters. The goal is to make IDs **informative, consistent, and scalable**, so you can tell the type, environment, and functional category of a container at a glance.

---

## 🔹 5-Digit Structure
```text
A B C D E
```

| Digit | Meaning                          |
|-------|----------------------------------|
| A     | Type                             |
| B     | Environment / Role               |
| C     | Department / Category            |
| D E   | Sequential number per department |

---

### 1️⃣ First Digit – Type
- `1` → VM  
- `2` → LXC / Container  

### 2️⃣ Second Digit – Environment
- `0` → Production / Live (do not modify lightly / Aesir)
- `1` → Experimental / Staging / Dev (can be modified or overwritten / Vanir)

### 3️⃣ Third Digit – Department / Category

| Digit | Category                   | Example Services                                 |
|-------|----------------------------|--------------------------------------------------|
| 0     | Security / Authentication  | Authelia, Vaultwarden, Fail2Ban                  |
| 1     | Media / Streaming          | FFMPEG Streamer, Pelican Panel, Plex, Jellyfin   |
| 2     | Utilities / Support        | ConvertX, Cron jobs, rclone                      |
| 3     | Monitoring / Observability | Mimir (Grafana), Loki, Prometheus node exporters |
| 4     | Cloud / File Services      | Nextcloud, Immich, MinIO                         |
| 5     | Development / Git          | Gitea, Gitlab                                    |
| 6     | Home / Automation          | Home Assistant (Frigg), Node-RED                 |
| 7     | Gaming / Virtual Worlds    | Minecraft, Palworld                              |
| 8     | Web / Proxy / Networking   | Nginx Proxy Manager, Traefik, Pi-hole            |
| 9     | Misc / Experimental        | Test containers, staging apps                    |

### 4️⃣ & 5️⃣ Fourth and Fifth Digits – Sequential Number
- Incremented per department to ensure unique IDs.  
- Example: `01`, `02`, `03`…

---

## 🔹 Example IDs for Current CTs/VMs

| Service / Container  | Type | Env  | Dept | Seq | 5-Digit ID |
|----------------------|------|------|------|-----|------------|
| Authelia             | CT   | Prod | 0    | 01  | 20001      |
| Vaultwarden          | CT   | Prod | 0    | 02  | 20002      |
| Mimir (Grafana)      | CT   | Prod | 3    | 01  | 20301      |
| Loki                 | CT   | Prod | 3    | 02  | 20302      |
| Nextcloud            | CT   | Prod | 4    | 01  | 20401      |
| Immich               | CT   | Prod | 4    | 02  | 20402      |
| FFMPEG Streamer      | CT   | Exp  | 1    | 01  | 21101      |
| Minecraft Servers    | CT   | Exp  | 7    | 01  | 21701      |
| Palworld Server      | CT   | Exp  | 7    | 02  | 21702      |
| Home Assistant       | CT   | Prod | 6    | 01  | 20601      |
| Nginx Proxy Manager  | CT   | Prod | 8    | 01  | 20801      |
| ConvertX             | CT   | Exp  | 2    | 01  | 21201      |
| Portainer VM         | VM   | Prod | 5    | 01  | 10051      |

---

## 🔹 Benefits of This Scheme
- **Readable at a glance:** Know type, environment, and department immediately.  
- **Scalable:** Up to 99 containers per department per environment.  
- **Safe:** Production/live containers are obvious (second digit = `0`).  
- **Organized:** Sequential numbers avoid collisions and simplify sorting.  

---

Maintained by  
Jeff M. • [@OnyxJeff](https://github.com/OnyxJeff)