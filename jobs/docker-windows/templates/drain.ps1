$ErrorActionPreference = "Stop";

echo "Querying docker service" | Out-File -Encoding ASCII -Append "c:\var\vcap\sys\log\docker-windows\drain.log"
$docker = Get-WmiObject -Class Win32_Service -Filter "Name='docker'"
if ($docker -eq $null) {
    echo "Docker service not found; Exiting 0" | Out-File -Encoding ASCII -Append "c:\var\vcap\sys\log\docker-windows\drain.log"
    "0"
    Exit 0
}

echo "Docker service found" | Out-File -Encoding ASCII -Append "c:\var\vcap\sys\log\docker-windows\drain.log"
If ($docker.State -Eq "Running") {
    echo "Docker service running; Stopping" | Out-File -Encoding ASCII -Append "c:\var\vcap\sys\log\docker-windows\drain.log"
    $docker.StopService() |  Out-File -Encoding ASCII -Append "c:\var\vcap\sys\log\docker-windows\drain.log"
}
$service.Delete()
echo "Docker service drained; Exit 0" | Out-File -Encoding ASCII -Append "c:\var\vcap\sys\log\docker-windows\drain.log"

"0"
Exit 0
