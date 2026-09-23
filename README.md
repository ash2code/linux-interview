# linux-interview

Q1: Find the files which are modified in the last 30 days.
    
    find /path/to/search -type f -mtime -30

    find /var/log    => search inside the /var/log directory
    -type f          => only files
    -mtime           => modification time
    -30              => less than the 30 days

    -mtime -30 means modified within the 30 days
    -mtime +30 means modified morethan 30 days ago
    -mtime 30 means approx 30 days old

    Interview question: find log files older than 30 days
    answer: find /var/log -type f "*.log" -mtime +30