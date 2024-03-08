$jobs = @(
  Start-Job {kubectl port-forward services/earth-listener-service 30007:5000}
  Start-Job {kubectl port-forward services/earth-queue-service 30008:15672}
)

try {
  Write-Host "Port forwarding jobs running. Press Ctrl+C to stop..."
  $jobs |Wait-Job
}
finally {
  $jobs |Remove-Job -Force
}
