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

## Day 3 — Bulk File Organizer

### What it does
Scans a directory, moves files into subdirectories by extension, logs each action with a timestamp, and skips files it can't categorize.

### Usage
```bash
chmod +x organizer.sh
./organizer.sh
```

### Output
Organizes files into folders:
```
testfiles/
├── text/        ← .txt files
├── images/      ← .jpg and .png files
└── scripts/     ← .sh files
```

Log file created at `/workspaces/logs/challenge3log`:
```
Mon Jun 23 10:01:12 UTC 2026 - Moved file1.txt to /text
Mon Jun 23 10:01:12 UTC 2026 - Moved file3.jpg to /images
Mon Jun 23 10:01:12 UTC 2026 - Skipped unknownfile (unknown extension)
```

### Commands Learned

| Command | Purpose |
|---|---|
| `for file in *` | loop through all files |
| `${file##*.}` | extract file extension |
| `${file%.*}` | extract filename without extension |
| `mkdir -p` | create folder only if not exists |
| `mv` | move file to folder |
| `continue` | skip current loop iteration |
| `-d "$file"` | check if item is a directory |
| `$0` | script's own name |
| `>>` | append to log file |

### Key Concepts

- `*` wildcard — shell expands to all files automatically
- `${var##*.}` — string manipulation to extract extension
- `-d` flag — check if something is a directory
- `||` — OR condition to handle multiple extensions
- `continue` — skip directories and script itself
- Always use `mkdir -p` before `mv` to ensure destination exists

## Day 4 — User Account Auditor

### What it does
Reads `/etc/passwd`, lists all non-system users (UID ≥ 1000), checks if their home directory exists, and flags accounts that have never logged in using `lastlog`.

### Usage
```bash
chmod +x useraudit.sh
./useraudit.sh
```

### Output
```
nobody - Home dir Not Exists
Warning ------------- nobody never logged in ------
codespace - Home directory Exists
Warning ------------- codespace never logged in ------
```

### Commands Learned

| Command | Purpose |
|---|---|
| `cat /etc/passwd` | view user database |
| `awk -F: '$3>=1000'` | filter non-system users by UID |
| `lastlog -u username` | check last login for specific user |
| `lastlog | grep "Never"` | find never logged in users |
| `while read var1 var2` | capture multiple variables from pipe |
| `[ -d "$homedir" ]` | check if directory exists |

### Key Concepts

- `/etc/passwd` fields: `$1`=username, `$3`=UID, `$6`=homedir, `$7`=shell
- UID ≥ 1000 = regular human users, below 1000 = system users
- `-F:` in awk — colon must be immediately after `-F` with no space
- `while read` — best way to read multiple variables from pipe
- Always quote variables in conditions — `"$homedir"` not `$homedir`
- Never-logged-in accounts are potential security risks in production!