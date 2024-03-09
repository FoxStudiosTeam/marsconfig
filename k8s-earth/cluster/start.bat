$jobs = @(
  Start-Job {kubectl port-forward services/earth-queue-service 30008:15672}
  Start-Job {kubectl port-forward services/earth-queue-service 30009:5672}
  Start-Job {kubectl port-forward services/earth-db-service 30012:5432}
  Start-Job {kubectl port-forward services/earth-mars-transmitter-service 30014:25578}
  Start-Job {kubectl port-forward services/earth-rest-service 30013:25576}
)

try {
  Write-Host "Port forwarding jobs running. Press Ctrl+C to stop..."
  $jobs |Wait-Job
}
finally {
  $jobs |Remove-Job -Force
}
