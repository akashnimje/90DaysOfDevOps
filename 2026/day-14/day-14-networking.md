# Day 14 – Networking Fundamentals & Hands-on Checks

## 🎯 Objective
To understand core networking concepts and practice essential Linux networking commands used in troubleshooting real-world connectivity issues.

---

## 🧠 Quick Concepts

### OSI (L1–L7) vs TCP/IP Stack
- The OSI model defines **7 layers** (Physical to Application) for conceptual understanding.
- The TCP/IP model uses **4 layers**: Link, Internet, Transport, and Application.
- OSI layers **L5–L7** map to TCP/IP’s **Application layer**, while **L1–L2** map to the **Link layer**.

---

### Where Protocols Sit in the Stack
- **IP** → Internet layer (OSI L3)  
- **TCP/UDP** → Transport layer (OSI L4)  
- **HTTP/HTTPS, DNS** → Application layer (OSI L7)

---

### Real Example
```bash
curl https://example.com
Explanation:
Application (HTTP) → Transport (TCP) → Internet (IP) → Link (Ethernet/Wi-Fi)

🛠 Hands-on Checklist
Target host: google.com

1️⃣ Identity
hostname -i
ip addr
Output:

172.31.6.84
inet 172.31.6.84/20 brd 172.31.15.255 scope global dynamic enx0
Observation:
The system is assigned a private IP address 172.31.6.84 on interface enx0.

2️⃣ Reachability
ping google.com
Output (sample):

64 bytes from 142.251.222.238: icmp_seq=1 ttl=119 time=1.50 ms
64 bytes from 142.251.222.238: icmp_seq=2 ttl=119 time=1.17 ms
Observation:
Host is reachable with low latency (~1–2 ms) and no packet loss.

3️⃣ Path (Traffic Route)
tracepath google.com
Output (sample):

1?: LOCALHOST
1:  ip-172-31-0-1.ap-southeast-2.compute.internal
2:  240.1.192.10
4:  99.83.112.105
Observation:
Packets traverse internal AWS network hops before exiting to the public internet.

4️⃣ Listening Ports
ss -tulpn
Output (important lines):

tcp LISTEN 0 4096 0.0.0.0:22
tcp LISTEN 0 4096 [::]:22
udp UNCONN 127.0.0.53:53
Observation:

SSH is listening on port 22.

DNS resolver is active on port 53.

5️⃣ Name Resolution
dig google.com
Output:

google.com.  85  IN  A  142.251.222.238
Observation:
DNS successfully resolved google.com to IP 142.251.222.238.

6️⃣ HTTP Check
curl -I https://google.com
Output:

HTTP/2 301
location: https://www.google.com/
server: gws
Observation:
Server responded successfully and redirected HTTP traffic to HTTPS.

7️⃣ Connection Snapshot
netstat -an | head
Output:

tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN
tcp 0 0 172.31.6.84:59020 3.27.177.158:443 ESTABLISHED
tcp6 0 0 :::22 :::* LISTEN
Observation:
System has active LISTEN and ESTABLISHED connections, confirming network activity.

🔍 Mini Task: Port Probe & Interpretation
Identified listening port: 22 (SSH)

nc -zv localhost 22
Output:

Connection to localhost 22 port [tcp/ssh] succeeded!
Observation:
SSH service is reachable locally.

If not reachable:
Next checks would be:

systemctl status ssh
iptables -L
🧩 Reflection
Fastest Signal When Something Breaks
ping gives the quickest confirmation of basic network connectivity.

Layer to Inspect
If DNS fails → Application layer (DNS service).

If HTTP 500 error → Application layer (web server/service).

Two Follow-up Checks in Real Incident
Check firewall configuration:

iptables -L
Check service health:

systemctl status nginx
✅ Outcome
Learned how to map OSI and TCP/IP models.

Practiced essential troubleshooting commands: ping, tracepath, ss, dig, curl, netstat, and nc.

Verified DNS resolution, HTTP connectivity, and active listening services.

Improved understanding of how traffic flows through different network layers in real scenarios.
