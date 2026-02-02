# Linux Troubleshooting Notes – Day 05

## Target Service / Process
- Service: SSH
- Process: sshd (listener)
- PID: 1300
- Host: AWS EC2 – Ubuntu 22.04 LTS
- **Observation:** SSH service running normally, no zombie or hung processes detected.

## Environment Basics
- `uname -a` → shows kernel version & architecture  
  **Observation:** System running Linux 5.x kernel, x86_64 architecture.
- `cat /etc/os-release` → shows Ubuntu version  
  **Observation:** Confirmed Ubuntu 22.04 LTS; environment consistent for troubleshooting.

## Filesystem Sanity
- `mkdir /tmp/runbook-demo` → directory created successfully  
  **Observation:** Filesystem writable; no permission issues.
- `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo` → file copy successful  
  **Observation:** Basic file operations succeed; disk healthy.

## CPU & Memory Snapshot
- `top` → load average ~0.00, system healthy  
  **Observation:** No high CPU load, system stable.
- `ps -o pid,pcpu,pmem,comm -p 1035` → sshd using negligible CPU/memory  
  **Observation:** SSH process lightweight, not causing performance issues.
- `free -h` → sufficient free RAM, no swap usage  
  **Observation:** Memory usage normal; no memory pressure.

## Disk & IO Snapshot
- `df -h` → root filesystem has sufficient space  
  **Observation:** Disk space healthy; no near-full partitions.
- `du -sh /var/log` → log size normal  
  **Observation:** Log files under control; no risk of disk exhaustion.

## Network Snapshot
- `ss -tulpn | grep ssh` → SSH listening on port 22  
  **Observation:** SSH ready to accept connections; correct port.
- `curl -I http://localhost` → connection refused as expected (no HTTP service)  
  **Observation:** Network behaving as expected; no unexpected services running.

## Logs Reviewed
- `journalctl -u ssh -n 50` → no SSH errors  
  **Observation:** SSH service starting and running cleanly.
- `tail -n 50 /var/log/auth.log` → no failed logins  
  **Observation:** No suspicious authentication activity; system secure.

## Quick Findings
- SSH service healthy  
- No CPU, memory, disk, or network issues  
- System is stable and operational

## Next Steps (if issues arise)
1. Restart SSH service: `sudo systemctl restart ssh`  
   **Observation:** Useful if service becomes unresponsive.
2. Increase SSH log verbosity (`LogLevel VERBOSE`)  
   **Observation:** Helps troubleshoot authentication or connection issues.
3. Capture traffic or system calls: `tcpdump -i eth0 port 22` or `strace -p 1035`  
   **Observation:** Advanced debugging for network or process-level issues.

## Resources
- `man sshd`
- `man journalctl`
