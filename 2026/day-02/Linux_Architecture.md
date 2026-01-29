**Linux** is an open-source UNIX-based operating system. The main component of the Linux operating system is Linux kernel. 
It is developed to provide low-cost or free operating system service to personal system users, which includes an X-window system, Emacs editor, IP/TCP GUI, etc.

_**Its Components:**_
**Kernel**:
Kernel is the main core component it is lies between the shell and the hardware. It controls the activity of other hardware components.

The kernel is responsible for:
Memory management: Manages and allocates memory efficiently.
Resource allocation: Distributes system resources to different processes.
Device management: Controls input/output devices like printers and scanners.
Process management: Manages process execution and scheduling.
Application interaction: Bridges applications with system-level functions.
Security: Provides essential system-level security.

**Shell:**
The Shell is also software or It can be determined as the interface to the kernel. It takes commands from the user and interprets them. 

**Hardware Layer**
Hardware layer of Linux is the lowest level of operating system track. 
It is plays a vital role in managing all the hardware components. 
It includes device drivers, kernel functions, memory management, CPU control, and I/O operations. 
This layer generalizes hard complexity, by providing an interface for software by assuring proper functionality of all the components.

**System utility**
System utilities are the commend line tools that preforms various tasks provided by user to make system management and administration better.
These utilities enables user to perform different tasks, such as file management, system monitoring, network configuration, user management etc.


**Process:**
A process means a program in execution. It generally takes an input, processes it, and gives us the appropriate output.
Foreground processes: Such kind of processes are also known as interactive processes. These are the processes that are to be executed or initiated by the user or the programmer; they can not be initialized by system services. 
Such processes take input from the user and return the output. While these processes are running, we can not directly initiate a new process from the same terminal.

Background processes: Such kind of processes are also known as non-interactive processes.
These are the processes that are to be executed or initiated by the system itself or by users, though they can even be managed by users.

**Process states:**
Created: The process has been launched, and its data structures are being set up.
Ready: Waiting for its turn on the CPU.
Running: Actively executing on the processor.
Sleeping (waiting): Waiting for something like input or a resource.
Stopped: The process is paused, usually by a user command.
Zombie: A Zombie process is one that has finished execution, but its parent has not yet read its exit status. It's "dead" but still occupies an entry in the process table.
Orphan: An Orphan process is one whose parent has terminated, but it is still running. The orphan process is re-parented to the init process (PID 1).
Terminated: The process is fully finished, resources are cleaned up.

**Managing the process:**
To get the list of jobs that are either running or stopped.
#jobs
To run all the pending and force stopped jobs in the background.
#bg
To get details of a process running in background.
#ps -ef | grep sleep
To run some processes in the background directly.
#sleep 100&
To run processes with priority.
#nice -n 5 sleep 100 
To get the list of all the running processes on your Linux machine.
#top

**SystemD:**
Systemd is a system and service manager for Linux operating systems. It’s responsible for booting your computer, starting and stopping services, managing processes, and handling system shutdowns.
Essentially, systemd is the first process (PID 1) that runs when your Linux system boots, and it stays active until the system shuts down.

**Key Features of systemd:**
Parallel service startup — Faster boot times
Service dependency management — Ensures correct startup order
Integrated logging via journald – Easier troubleshooting
Service monitoring & auto-restart — Keeps critical services alive
Resource control — Limit CPU/memory usage per service

**How systemd Organizes Services:**
Systemd uses unit files to describe services, targets, devices, sockets, timers, and more. The most common type is the service unit (.service).
