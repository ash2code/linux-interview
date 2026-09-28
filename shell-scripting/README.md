# Shell Scripting Interview Examples

These scripts are small examples for learning Bash and preparing for interviews. Read the comments inside each file before running it.

## How to run a script

Make the scripts executable once:

```bash
chmod +x *.sh
```

Run a script from this directory:

```bash
./19-hello-world.sh
./26-regex-shellscript.sh 12345
```

You can also run any script with Bash:

```bash
bash 19-hello-world.sh
```

Some scripts need arguments. Run them without arguments to see the usage message, or check the comment at the top of the file.

## Why do some scripts use `${1:-value}`?

This is optional argument syntax:

```bash
path=${1:-/}
threshold=${2:-80}
```

- `$1` means the first value passed to the script.
- `$2` means the second value passed to the script.
- `:-/` means use `/` when the first value was not provided.
- `:-80` means use `80` when the second value was not provided.

There must not be spaces around `=`. This is wrong:

```bash
path = "/"
```

For beginner examples, most scripts use hardcoded values such as `path="/"` and `threshold=80`. Change those lines directly while practising. The argument examples keep `$1`, `$2`, `$#`, and `$@` because passing values is the topic of those scripts.

## What does `set -euo pipefail` mean?

This is a useful setting in production scripts, but it can look confusing when you are learning.

```bash
set -euo pipefail
```

It combines three settings:

- `set -e`: stop the script when a command fails.
- `set -u`: show an error when the script uses a variable that was not set.
- `set -o pipefail`: make a pipeline fail if any command in the pipeline fails.

Example:

```bash
set -e
mkdir /path/that/does/not/exist
echo "This line will not run"
```

For these learning examples, the setting is not required. It is normally used in production scripts to find errors early. Start with simple commands and add it when you understand the script.

## A few lines you will see often

```bash
#!/usr/bin/env bash
```

This tells Linux to run the file with Bash.

```bash
if [[ -f "$file" ]]; then
```

This checks whether `$file` is a regular file. The quotes protect paths that contain spaces.

```bash
if [[ -z "$username" ]]; then
```

`-z` checks whether the value is empty. In this example, it checks whether the username is empty.

```bash
continue
```

`continue` skips the current loop item and moves to the next item.

```bash
command >/dev/null 2>&1
```

This hides normal output and error output. It is useful when we only need the command's success or failure status.

```bash
if command; then
    echo "Command worked"
else
    echo "Command failed"
fi
```

A command returns status `0` when it succeeds. Any non-zero status means failure.

## Important interview points

- Quote variables: use `"$file"`, not `$file`.
- Use `[[ ... ]]` for Bash conditions.
- Use `$(( ... ))` for integer arithmetic.
- Use `case` when one value can have several choices.
- Use `"$@"` to pass all arguments while keeping each argument separate.
- Check a command's result with `$?`, or use the command directly in an `if` statement.
- Be careful with `rm`, `useradd`, `mv`, `chmod`, and `chown`. Test on `/tmp` or a test virtual machine first.

## Script list

- `01-basic-for-loop.sh`: loop through a list.
- `02-function-example.sh`: create and call a function.
- `03-arithmetic-operators.sh`: perform calculations.
- `04-backup-and-restore.sh`: create and restore a TAR backup.
- `05-log-rotation.sh`: keep five old log copies.
- `06-cpu-memory-disk.sh`: show basic system health.
- `07-logical-operators.sh`: use AND, OR, and NOT.
- `08-useradd.sh`: create a Linux user.
- `09-case-statements.sh`: handle service actions.
- `10-continue-example.sh`: skip selected loop items.
- `11-break-example.sh`: stop a loop early.
- `12-cpu-alert.sh`: compare CPU load with a threshold.
- `13-disk-space.sh`: check filesystem usage.
- `14-echo-example.sh`: print text and variables.
- `15-user-inputs.sh`: read values from a user.
- `16-user-passing-arguments.sh`: use positional arguments.
- `17-eval-example.sh`: show `eval` and why input must be trusted.
- `18-for-loop.sh`: use a C-style loop.
- `19-hello-world.sh`: first Bash script.
- `20-if-elif-else.sh`: select a grade using conditions.
- `21-if-else-statements.sh`: check a file.
- `22-memory-usage.sh`: check memory against a threshold.
- `23-files-more-than-x-days.sh`: find old files.
- `24-nested-if.sh`: use an if statement inside another if statement.
- `25-or-operator.sh`: use the OR operator.
- `26-regex-shellscript.sh`: validate text with a regular expression.
- `27-special-variables.sh`: show common Bash variables.
- `28-check-file-exists.sh`: check a file or directory.
- `29-check-user-exists.sh`: check a Linux user.
- `30-while-loop.sh`: repeat while a condition is true.
- `31-special-parameters.sh`: explain `$#`, `$?`, `$@`, and `$0`.
- `32-compare-strings.sh`: compare two strings.
- `33-check-empty-string.sh`: use `-z` and `-n` with strings.
- `34-substring-example.sh`: extract part of a string.
- `35-uppercase-lowercase.sh`: change string case.
- `36-backup-last-24-hours.sh`: back up files changed in the last 24 hours.
