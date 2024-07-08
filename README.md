# Kill Ports Scripts

This repository contains scripts to find and kill processes running on specified ports. There are two versions of the script: one written in Bash for Unix-based systems and another written in PowerShell for Windows systems.

## Directory Structure

KillPortsScripts/\
├── bash/ \
│ └── kill_ports.sh \
|─── powershell/ \
|   └── KillPorts.ps1 \


## Scripts

### Bash Script

The Bash script is located in the `bash/` directory and is named `kill_ports.sh`.

#### Usage

1. Make the script executable:
    ```bash
    chmod +x bash/kill_ports.sh
    ```

2. Run the script with the ports you want to target:
    ```bash
    ./bash/kill_ports.sh 8080 3000 8000
    ```

#### Example
```bash
$ ./bash/kill_ports.sh 8080 3000 8000
Killing process 1234 on port 8080
Process 1234 on port 8080 has been killed successfully.
No process found on port 3000
Killing process 5678 on port 8000
Process 5678 on port 8000 has been killed successfully.
