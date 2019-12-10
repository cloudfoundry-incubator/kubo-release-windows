$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

C:\var\vcap\packages\docker-windows\docker\dockerd --register-service

Start-Service Docker
