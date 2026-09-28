# Linux Interview Questions


## 1. Find files changed in the last 30 days

```bash
find /var/log -type f -mtime -30
```

This looks for files changed in the last 30 days under `/var/log`.

Example output:

```text
/var/log/syslog
/var/log/auth.log
```

To find `.log` files that are more than 30 days old, use:

```bash
find /var/log -type f -name "*.log" -mtime +30
```

Example output:

```text
/var/log/archive/old-app.log
```

`mtime` means the time a file was changed. `atime` means the time it was last accessed. `find` counts full days, so `-mtime +30` finds files that are at least 31 days old. You may see a permission warning if your account cannot read a folder.

## 2. Check CPU use

```bash
top
```

`top` shows live information about CPU use and running programs. Press `q` to close it.

Example output:

```text
%Cpu(s):  7.0 us,  2.0 sy, 91.0 id
PID   COMMAND    %CPU
812   firefox    24.0
642   code       12.5
```

## 3. Find the 10 programs using the most CPU

```bash
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 11
```

The output starts with a header, then lists up to 10 programs. Here are a few example rows:

```text
	PID COMMAND         %CPU
	812 firefox         24.0
	642 code            12.5
	405 chrome           8.1
```

## 4. Find the 10 programs using the most memory

```bash
ps -eo pid,comm,%mem --sort=-%mem | head -n 11
```

The `%MEM` column shows the share of memory used by each program. Here are a few example rows:

```text
	PID COMMAND         %MEM
	812 firefox          4.2
	642 code             3.1
	405 chrome           2.8
```

## 5. Check memory

```bash
free -h
```

This shows how much memory is used and available. The `-h` option uses easy-to-read units.

Example output:

```text
			   total        used        free      shared  buff/cache   available
Mem:           7.7Gi       2.3Gi       280Mi        62Mi       5.1Gi       5.2Gi
Swap:             0B          0B          0B
```

## 6. Check system load

```bash
uptime
```

This shows how long the computer has been running and its load averages for the last 1, 5, and 15 minutes. Load is not the same as CPU use.

Example output:

```text
09:42:10 up 3 days,  2:15,  2 users,  load average: 0.42, 0.38, 0.35
```
