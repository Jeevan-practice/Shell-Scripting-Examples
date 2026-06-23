# Shell Scripting Examples

## Day 1 — System Health Report Script

### What it does
Collects system health information and saves it to a timestamped report file.

### Usage
```bash
chmod +x health_report.sh
./health_report.sh
```

### Output
Creates a file named `report_YYYY-MM-DD.txt` with the following sections:
- Memory Usage (used/total)
- Disk Usage (per filesystem)
- CPU Usage (%)
- Top 5 Memory Consuming Processes

### Commands Learned

| Command | Purpose |
|---|---|
| `free -h` | Memory usage |
| `df -h` | Disk space per filesystem |
| `vmstat 1 1` | CPU usage snapshot |
| `ps aux` | List all running processes |
| `awk` | Extract specific columns from output |
| `sort -rn -k4` | Sort processes by memory (highest first) |
| `date +%Y-%m-%d` | Timestamp in YYYY-MM-DD format |
| `exec > file` | Redirect all script output to a file |

### Key Concepts

- `NR==2` in awk — select specific row number
- `$1, $2...` in awk — select specific column
- `-F:` in awk — change column separator
- `NR!=1` — skip header line
- `$(command)` — command substitution
- `echo -e` — enable escape sequences like `\n`, `\t`