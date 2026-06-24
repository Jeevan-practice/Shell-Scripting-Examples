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

## Day 2 — Log File Analyzer

### What it does
Accepts a log file as argument, counts ERROR/WARN/INFO occurrences, finds the most frequent IP address, and exits with code 1 if errors exceed threshold.

### Usage
```bash
chmod +x loganalyzer.sh
./loganalyzer.sh sample.log
echo $?    # 0 = ok, 1 = errors exceeded threshold
```

### Output
```
ERROR_Count = 4
WARN_Count = 2
INFO_Count = 4
Frequently occuring IP = 192.168.1.1
```

### Commands Learned

| Command | Purpose |
|---|---|
| `grep -c "ERROR" file` | Count matching lines |
| `uniq -c` | Count duplicate lines |
| `sort -rn -k1` | Sort by count highest first |
| `$1` | First argument passed to script |
| `$?` | Last command exit code |
| `exit 0` / `exit 1` | Exit with success / failure code |

### Key Concepts

- `-z "$1"` — check if argument is empty (validate input)
- `$(command)` — store command output in variable
- `-gt` — greater than comparison in if condition
- Always use `echo $?` not just `$?` to check exit code