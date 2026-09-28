# Linux Interview Questions

These are practical Linux questions and commands that commonly come up in interviews and day-to-day server work. The explanations are kept short so they are easy to revise.

## 1. How do you find files changed in the last 30 days?

```bash
find /var/log -type f -mtime -30
```

What it does:

- `find /var/log` searches inside `/var/log`.
- `-type f` selects regular files only.
- `-mtime -30` finds files modified less than 30 full days ago.
- `mtime` means modification time. `atime` means the last access time.

To find `.log` files older than 30 days:

```bash
find /var/log -type f -name "*.log" -mtime +30
```

- `-name "*.log"` selects files ending in `.log`.
- `-mtime +30` selects files that are more than 30 full days old.
- Permission warnings can appear when the current user cannot read a directory.

## 2. How do you check CPU usage?

```bash
top
```

What it does:

- `top` shows CPU usage and running processes in real time.
- The `%CPU` column shows CPU usage for each process.
- Press `q` to exit.

## 3. How do you find the 10 processes using the most CPU?

```bash
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 11
```

What it does:

- `ps -e` shows all processes.
- `-o pid,comm,%cpu` displays the process ID, command name, and CPU usage.
- `--sort=-%cpu` sorts from highest CPU usage to lowest.
- `head -n 11` prints the header and the top 10 processes.

## 4. How do you find the 10 processes using the most memory?

```bash
ps -eo pid,comm,%mem --sort=-%mem | head -n 11
```


## 5. How do you check memory usage?

```bash
free -h
```

What it does:

- `free` displays memory and swap usage.
- `-h` displays values in readable units such as MiB or GiB.
- The `available` value is usually more useful than `free` because it includes memory that Linux can reclaim.

## 6. How do you check CPU load?

```bash
uptime
```

What it does:

- `uptime` shows the current time, system uptime, logged-in users, and load averages.
- The load averages represent the last 1, 5, and 15 minutes.
- Load is not the same as CPU usage. It also includes processes waiting for CPU or other resources.
09:42:10 up 3 days,  2:15,  2 users,  load average: 0.42, 0.38, 0.35
```

## 7. How do you check disk usage?

To check filesystem usage:

```bash
df -h
```

What it does:

- `df` shows used and available space on mounted filesystems.
- `-h` displays readable units.
- Check the `Use%` column to find a filesystem that is nearly full.

To check the size of a directory:

```bash
du -sh /var/log
```

- `du` shows space used by files and directories.
- `-s` shows only the total for the selected directory.
- `-h` displays readable units.

Remember:

- `df` checks filesystem space.
- `du` checks space used by files and directories.

## 8. How do you find files larger than 10 GB?

```bash
find / -type f -size +10G 2>/dev/null
- `-type f` selects regular files only.
- `-size +10G` finds files larger than 10 GB.
- `2>/dev/null` hides permission-denied messages.
- This command may take time and may require `sudo` to search all directories.

## 9. How do you find which directory is using the most disk space?

```bash
du -xhd1 / 2>/dev/null | sort -hr
```

What it does:

- `du` calculates directory sizes.
- `-x` stays on the same filesystem.
- `-h` uses readable units.
- `-d1` checks the root directory and its immediate subdirectories.
- `sort -hr` sorts the results from largest to smallest.
- Check the largest directory again with the same command, using that directory as the path.

## 10. How do you troubleshoot a filesystem that is 100% full?

Follow these steps:

	df -h
	```

2. Check inode usage. A filesystem can run out of inodes even when space remains:

	```bash
	df -i
	```

3. Find the largest directories on the affected filesystem:

	```bash
	du -xhd1 / 2>/dev/null | sort -hr
	```

4. Check for large files:

	```bash
	find / -xdev -type f -size +1G -ls 2>/dev/null
	```

5. Check for deleted files that are still held open by a process:

	```bash
	sudo lsof +L1
	```

6. Check logs, temporary files, old backups, and core dumps before deleting anything.

7. Do not remove files blindly. Confirm that a file is safe to delete, and restart the related service when needed to release a deleted file.

## 11. How do you check which ports are listening?

For TCP ports:

```bash
ss -lntp
```

What it does:

- `-l` shows listening sockets.
- `-n` shows port numbers instead of resolving service names.
- `-t` shows TCP sockets.
- `-p` shows the process using the socket. Some process details may require `sudo`.

For UDP ports:

```bash
ss -lnup
```

- `-u` shows UDP sockets.
- The other options have the same meaning as above.

## 12. How do you check the IP address of a Linux system?

```bash
ip addr show
```

Short form:

```bash
ip a
```

What it does:

- Look for the `inet` address under the required network interface.
- `lo` is the loopback interface and usually has the address `127.0.0.1`.
- An address such as `192.168.1.20/24` is usually a private IPv4 address.
- Use `ip -br addr` for a shorter summary.

## 13. How do you check the default gateway and routing table?

```bash
ip route
```

What it does:

- The line beginning with `default via` shows the default gateway.
- The gateway is normally used to reach networks outside the local network.
- If there is no default route, the system may not reach the internet or other networks.

To check the route to a specific IP address:

```bash
ip route get 8.8.8.8
```

## 14. How do you troubleshoot a system with no internet access?

Follow these steps:

1. Check that the network interface is up:

	```bash
	ip link
	```

2. Check that the system has an IP address:

	```bash
	ip -br addr
	```

3. Check the default gateway:

	```bash
	ip route
	```

4. Test the gateway. Replace the address with the gateway shown by `ip route`:

	```bash
	ping -c 4 192.168.1.1
	```

5. Test internet connectivity using an IP address:

	```bash
	ping -c 4 8.8.8.8
	```

6. Test DNS separately:

	```bash
	getent hosts example.com
	```

7. If the IP test works but the name test fails, investigate DNS settings in `/etc/resolv.conf` or the system resolver service.

## 15. How do you troubleshoot a DNS problem?

```bash
getent hosts example.com
```

You can also use:

```bash
dig example.com
```

What it does:

- `getent hosts` uses the system's configured name-resolution method.
- `dig` gives detailed DNS information. It may need the `dnsutils` package.
- Check `/etc/resolv.conf` for configured DNS servers.
- If `ping 8.8.8.8` works but `ping example.com` fails, DNS is a likely problem.

## 16. How do you check whether a remote port is reachable?

```bash
nc -vz example.com 443
```

What it does:

- `nc` means netcat.
- `-v` shows details.
- `-z` checks the port without sending application data.
- Replace `example.com` and `443` with the required host and port.
- A successful connection proves that the port is reachable, but it does not prove that the application is working correctly.

## 17. A service is running, but clients cannot connect. What do you check?

Follow these steps:

1. Check whether the process is running:

	```bash
	ps -ef | grep '[s]ervice-name'
	```

2. Check whether the service is listening:

	```bash
	ss -lntp
	```

3. Check whether it is listening on the correct address. `127.0.0.1` accepts local connections only; `0.0.0.0` accepts IPv4 connections on all interfaces.

4. Test the service locally:

	```bash
	curl -I http://127.0.0.1:8080
	```

5. Check firewall rules and service logs:

	```bash
	sudo ufw status
	sudo journalctl -u service-name --since "30 minutes ago"
	```

## 18. How do you check the path to a remote host?

```bash
traceroute example.com
```

On some systems, use:

```bash
tracepath example.com
```

What it does:

- These commands show the network hops between the local system and the destination.
- A `*` does not always mean that the hop is broken. Some routers do not reply to traceroute packets.
- Use this command together with `ping` and `nc`; one command alone is not always conclusive.

## 19. What is the difference between the common `kill` signals?

First find the process ID:

```bash
pgrep -af process-name
```

Then send a signal:

```bash
kill -TERM PID
```

Common signals:

- `kill PID` sends `SIGTERM` (signal 15) by default. It asks the process to stop cleanly.
- `kill -INT PID` sends `SIGINT` (signal 2). It is similar to pressing `Ctrl+C` in a terminal.
- `kill -KILL PID` sends `SIGKILL` (signal 9). The kernel stops the process immediately. The process cannot clean up or handle this signal, so use it only as a last resort.
- `kill -STOP PID` pauses a process. The process cannot handle or ignore this signal.
- `kill -CONT PID` continues a process that was stopped.
- `kill -HUP PID` sends `SIGHUP` (signal 1). Many services use it to reload configuration, but the exact behavior depends on the service.

To list signal names and numbers:

```bash
kill -l
```

Important points:

- `kill` sends a signal; it does not always immediately terminate a process.
- Use `sudo` only when the current user does not have permission to signal the process.
- Prefer `SIGTERM` before `SIGKILL` so the application can close files and save data.

## 20. What is the difference between a soft link and a hard link?

### Soft link (symbolic link)

```bash
echo "application configuration" > app.conf
ln -s app.conf app.conf.link
cat app.conf.link
```

What it means:

- A soft link stores the path to another file.
- It can point to a file or directory.
- It can cross filesystems.
- If the original file is deleted or moved, the link becomes broken.

### Hard link

```bash
ln app.conf app.conf.hard
cat app.conf.hard
```

What it means:

- A hard link points to the same inode and file data as the original file.
- Changes made through either name are visible through both names.
- It normally cannot cross filesystems.
- It cannot normally be created for a directory.
- Removing the original filename does not remove the data while the hard link still exists.

To inspect links and inode numbers:

```bash
ls -li app.conf app.conf.link app.conf.hard
```

## 21. How do you create and extract ZIP files?

Create a ZIP archive:

```bash
zip -r project.zip project/
```

Extract a ZIP archive:

```bash
unzip project.zip -d project-extracted/
```

What it means:

- `zip` creates ZIP archives.
- `-r` includes directories and their contents recursively.
- `unzip` extracts a ZIP archive.
- `-d` selects the extraction directory.
- List files without extracting them:

  ```bash
  unzip -l project.zip
  ```

## 22. How do you create and extract TAR archives?

Create an uncompressed TAR archive:

```bash
tar -cvf project.tar project/
```

Extract it:

```bash
tar -xvf project.tar
```

Create a gzip-compressed TAR archive:

```bash
tar -czvf project.tar.gz project/
```

Extract it:

```bash
tar -xzvf project.tar.gz
```

What it means:

- `c` creates an archive.
- `x` extracts an archive.
- `v` shows the files being processed.
- `f` specifies the archive filename.
- `z` handles gzip compression.
- List an archive without extracting it:

  ```bash
  tar -tzf project.tar.gz
  ```

## 23. What are some basic Linux commands?

| Command | Example | Use |
| --- | --- | --- |
| `pwd` | `pwd` | Show the current directory. |
| `ls` | `ls -lah` | List files, including hidden files, with readable sizes. |
| `cd` | `cd /var/log` | Change directory. |
| `mkdir` | `mkdir -p app/logs` | Create a directory and its parent directories. |
| `touch` | `touch app.log` | Create an empty file or update its timestamp. |
| `cp` | `cp source.txt backup.txt` | Copy a file. |
| `mv` | `mv old.txt new.txt` | Move or rename a file. |
| `rm` | `rm old.txt` | Delete a file. |
| `cat` | `cat app.log` | Print a file's contents. |
| `less` | `less app.log` | Read a large file one screen at a time. |
| `head` | `head -n 10 app.log` | Show the first 10 lines. |
| `tail` | `tail -f app.log` | Follow new lines added to a file. |
| `grep` | `grep -i error app.log` | Search for text without case sensitivity. |
| `wc` | `wc -l app.log` | Count lines in a file. |
| `which` | `which python3` | Show the executable found in `PATH`. |

Important points:

- Be careful with `rm`; deleted files are not normally moved to a recycle bin.
- Use quotes around paths that contain spaces.
- Use `command --help` or `man command` to read more about a command.

## 24. How do Linux file permissions work?

Check permissions:

```bash
ls -l app.conf
```

Example output:

```text
-rw-r----- 1 alice developers 120 Sep 28 10:00 app.conf
```

Read the permission string from left to right:

- The first character shows the type. `-` means a regular file and `d` means a directory.
- The next three characters are permissions for the owner: `rw-` means read and write.
- The next three are permissions for the group: `r--` means read only.
- The last three are permissions for others: `---` means no access.
- `r` means read, `w` means write, and `x` means execute.

Change permissions using symbolic mode:

```bash
chmod u+x script.sh
chmod g-w app.conf
chmod o-r secret.txt
```

- `u` means user or owner.
- `g` means group.
- `o` means others.
- `+` adds a permission and `-` removes one.

Change permissions using numeric mode:

```bash
chmod 640 app.conf
chmod 755 script.sh
```

Permission values are `r = 4`, `w = 2`, and `x = 1`:

- `640` means owner `rw-`, group `r--`, and others `---`.
- `755` means owner `rwx`, group `r-x`, and others `r-x`.

Change ownership:

```bash
sudo chown alice:developers app.conf
```

What it means:

- `chown` changes the owner.
- `alice:developers` sets the owner to `alice` and the group to `developers`.
- Use `chown -R` carefully because it changes ownership recursively.
- For directories, read allows listing names, write allows creating or deleting entries, and execute allows entering the directory.

## 25. What is `sed` used for?

`sed` is useful for finding and changing text in a stream or file.

Print lines that contain `ERROR`:

```bash
sed -n '/ERROR/p' app.log
```

Replace the first `old` value on each line with `new`:

```bash
sed 's/old/new/' app.conf
```

Replace every matching value on each line:

```bash
sed 's/old/new/g' app.conf
```

What it does:

- `-n` stops `sed` from printing every line automatically.
- `/ERROR/p` prints only lines matching `ERROR`.
- `s` means substitute.
- `g` means replace all matches on a line.
- These commands print the result and do not change the original file.

To change a file in place, make a backup first:

```bash
sed -i.bak 's/old/new/g' app.conf
```

This updates `app.conf` and saves the original as `app.conf.bak`.

## 26. What are some useful `grep` scenarios?

Find errors in a log without caring about uppercase or lowercase:

```bash
grep -i "error" app.log
```

Search all files under a directory:

```bash
grep -Rni "timeout" /var/log/myapp/
```

What it does:

- `-i` ignores case.
- `-R` searches directories recursively.
- `-n` shows the line number.
- Use `-w` to match a complete word instead of part of a word.
- Use `-v` to show lines that do not match.

Count matching lines:

```bash
grep -c "404" access.log
```

Show a few lines before and after a match:

```bash
grep -C 2 " failed " app.log
```

Find running processes without accidentally matching the `grep` command itself:

```bash
ps -ef | grep '[n]ginx'
```

## 27. What is `awk` used for?

`awk` is useful when you need to work with columns or calculate values.

Print the first and third columns from a space-separated file:

```bash
awk '{print $1, $3}' users.txt
```

Print selected columns from a comma-separated file:

```bash
awk -F',' '{print $1, $3}' users.csv
```

What it does:

- `$1`, `$2`, and `$3` mean the first, second, and third fields.
- `$0` means the complete line.
- `-F','` sets the comma as the field separator.
- `NR` is the current line number.
- `NF` is the number of fields in the current line.

Print users whose CPU usage is greater than 50 percent:

```bash
ps -eo user,pid,%cpu,comm --no-headers | awk '$3 > 50 {print}'
```

Add the values in the third column:

```bash
awk '{total += $3} END {print total}' numbers.txt
```

## 28. What is `cut` used for?

`cut` extracts selected characters or fields from each line.

Get usernames from `/etc/passwd`:

```bash
cut -d: -f1 /etc/passwd
```

What it does:

- `-d:` sets the colon as the delimiter.
- `-f1` selects the first field.
- `/etc/passwd` uses colons to separate its fields.

Get the first and third fields from a CSV file:

```bash
cut -d',' -f1,3 users.csv
```

Get the first five characters of each line:

```bash
cut -c1-5 app.log
```

Use `cut` when the file has simple, fixed separators. For more complex CSV files with quoted commas, use a CSV-aware tool instead.

## 29. How do you use `head`?

Show the first 10 lines of a file:

```bash
head app.log
```

Show the first 20 lines:

```bash
head -n 20 app.log
```

Show the first 100 bytes:

```bash
head -c 100 app.log
```

What it does:

- `head` is useful for quickly checking the beginning of a file.
- The default is usually 10 lines.
- It is useful for checking column names in a CSV file or the first entries in a log.

## 30. How do you use `tail`?

Show the last 10 lines of a file:

```bash
tail app.log
```

Show the last 50 lines:

```bash
tail -n 50 app.log
```

Watch a log file as new lines are added:

```bash
tail -f /var/log/syslog
```

What it does:

- `tail` is useful for checking the newest entries in a file.
- `-n 50` shows the last 50 lines.
- `-f` keeps the command running and prints new lines as they appear.
- Press `Ctrl+C` to stop `tail -f`.
- `tail -F` is useful when a log file is rotated and recreated.
