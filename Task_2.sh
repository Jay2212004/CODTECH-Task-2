#!/bin/bash
# This script checks the reachability of a target host, scans for open ports and detects services running on them,
# and checks for common web vulnerabilities by examining HTTP headers. It provides detailed feedback on open ports,
# services detected, and potential web vulnerabilities found on the target host.
check_host() {
    ping -c 1 $1 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Host $1 is reachable"
    else
        echo "Host $1 is unreachable"
        exit 1
    fi
}
scan_ports() {
    echo "Scanning for open ports and service versions on $1 ..."

    # Ask user for port range
    read -p "Enter starting port (default 1): " start_port
    start_port=${start_port:-1}
    read -p "Enter ending port (default 65535): " end_port
    end_port=${end_port:-65535}

    echo "Scanning ports $start_port to $end_port ..."

    for (( port=$start_port; port<=$end_port; port++ )); do
        (echo >/dev/tcp/$1/$port) &>/dev/null
        if [ $? -eq 0 ]; then
            echo "Port $port is open"
            # Perform service version detection (simple example)
            service=$(echo "GET / HTTP/1.1\r\n\r\n" | nc -w 1 $1 $port | grep "Server:")
            if [ -n "$service" ]; then
                echo "  Service running on port $port: $service"
            fi
        fi
    done
}
check_web_vulnerabilities() {
    echo "Checking for common web vulnerabilities on $1 ..."
    # Example: Checking for HTTP Headers
    headers=$(curl -sI http://$1)
    if [[ $headers == *"Server"* ]]; then
        echo "  HTTP Server header found: $headers"
    fi
}
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target>"
    exit 1
fi
target=$1
check_host $target
scan_ports $target
check_web_vulnerabilities $target
exit 0
