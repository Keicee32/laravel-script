#!/bin/bash

# Define the output HTML file
output_file="system_metrics.html"

# Get memory usage
memory_usage=$(free -h | grep Mem | awk '{print "Total: " $2 " Used: " $3 " Free: " $4}')

# Get disk usage
disk_usage=$(df -h | grep -E '^/dev/' | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6}' | 
    awk 'NR==1{print "Filesystem Total Used Available Use% MountedOn"} {print $0}')

# Get server uptime
server_uptime=$(uptime -p)

# Check server response to HTTP request
http_response=$(curl -I http://example.com -s -o /dev/null -w "%{http_code}")

# Generate HTML report
cat <<EOL > $output_file
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Metrics Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>System Metrics Report</h1>
    <h2>Memory Usage</h2>
    <p>$memory_usage</p>
    
    <h2>Disk Usage</h2>
    <table>
        <tr>
            <th>Filesystem</th>
            <th>Total</th>
            <th>Used</th>
            <th>Available</th>
            <th>Use%</th>
            <th>Mounted On</th>
        </tr>
        $(echo "$disk_usage" | awk 'NR>1{print "<tr><td>" $1 "</td><td>" $2 "</td><td>" $3 "</td><td>" $4 "</td><td>" $5 "</td><td>" $6 "</td></tr>"}')
    </table>
    
    <h2>Server Uptime</h2>
    <p>$server_uptime</p>

    <h2>HTTP Response Status</h2>
    <p>HTTP Status Code: $http_response</p>
</body>
</html>
EOL

echo "Metrics report generated: $output_file"

