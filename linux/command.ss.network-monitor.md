# `ss` command

1. Listing all Connections `ss`
2. Listing Listening and Non-listening Ports `ss -a`
3. Listing Listening Sockets `ss -l`
4. List all TCP Connections `ss -t`
5. List all Listening TCP Connections `ss -lt`
6. List all UDP Connections `ss -ua`
7. List all Listening UDP Connections `ss -lu`
8. Display PID (Process IDs) of Sockets `ss -p`
9. Display Summary Statistics `ss -s`
10. Display IPv4 and IPv6 Socket Connections `ss -4`, `ss -6`
11. Filter Connections by Port Number `ss -at '( dport = :22 or sport = :22 )'`, `ss -at '( dport = :ssh or sport = :ssh )'`
12. Check Man Pages for ss Command `man ss`
