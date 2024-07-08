param (
    [Parameter(Mandatory=$true)]
    [int[]]$Ports
)

foreach ($port in $Ports) {
    # Get the process ID associated with the port
    $TaskPid = (Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue).OwningProcess

    if ($null -eq $TaskPid) {
        Write-Output "No process found on port $port"
        continue
    }

    # Get the process object
    $process = Get-Process -Id $TaskPid -ErrorAction SilentlyContinue

    if ($null -eq $process) {
        Write-Output "No process found with PID $TaskPid on port $port"
        continue
    }

    # Kill the process forcefully
    Write-Output "Killing process $TaskPid on port $port"
    Stop-Process -Id $TaskPid -Force

    if ($?) {
        Write-Output "Process $TaskPid on port $port has been killed successfully."
    } else {
        Write-Output "Failed to kill process $TaskPid on port $port."
    }
}
