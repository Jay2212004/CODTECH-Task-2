Name:Uchagaonkar Jay Sachin

Company:CODTECH IT SOLUTIONS

ID:62jfeh397

Domain:Cyber Security & Ethical Hacking

Duration:June 27,2024 to July 26,2024

Mentor:S.K.Lahari

Overview of the project

Project Name:-VULNERABILITY SCANNING TOOL

This project, `VULNERABILITY SCANNING TOOL`, is a Bash script that performs network diagnostic tasks. It checks the reachability of a target host, scans for open ports and their service versions, and checks for common web vulnerabilities on the specified target.

Features

- Host Reachability Check: Verifies if the target host is reachable using the `ping` command.
- Port Scanning: Scans a range of ports on the target host to identify open ports and the services running on them.
- Service Version Detection: Detects and displays the service version running on open ports.
- Web Vulnerability Check: Checks for common web vulnerabilities, such as identifying HTTP headers.

How It Works

1. Host Reachability Check: 
   - The script uses the `ping` command to check if the target host is reachable.
   - If the host is unreachable, the script exits with an error message.

2. Port Scanning:
   - The user is prompted to enter a range of ports to scan (default range is 1 to 65535).
   - The script scans each port in the specified range using a TCP connection.
   - If a port is open, the script attempts to detect the service version running on that port using a simple HTTP request.

3. Web Vulnerability Check:
   - The script uses `curl` to fetch HTTP headers from the target host.
   - If the "Server" header is found in the response, it is displayed as part of the vulnerability check.

Getting Started

To run this script, you need to have a Unix-like operating system with Bash installed. Follow these steps to get started:

1. Clone the repository:
   ```
   git clone https://github.com/Jay2212004/CODTECH-Task-2.git
   ```
2. Navigate to the project directory:
   ```
   cd CODTECH-Task-2
   ```
3. Make the script executable:
   ```
   chmod +x scan.sh
   ```
4. Run the script with the target host as an argument:
   ```
   ./scan.sh <target>
   ```

Usage

1. Execute the script with a target host:
   ```
   ./scan.sh example.com
   ```
2. The script will check if the target host is reachable.
3. Enter the starting and ending ports when prompted to scan for open ports.
4. The script will display open ports and their service versions.
5. It will then check for common web vulnerabilities and display the results.

Requirements

- Unix-like operating system with Bash
- `ping` command
- `nc` (netcat) command
- `curl` command

Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the project.

License

This project is licensed under the MIT License. See the LICENSE file for details.

This project is licensed under the MIT License. See the LICENSE file for details.
