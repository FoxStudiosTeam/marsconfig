$jobs = @(
  Start-Job {kubectl port-forward services/mars-listener-service 30007:25565}
  Start-Job {kubectl port-forward services/mars-queue-service 30010:15672}
  Start-Job {kubectl port-forward services/mars-db-service 30015:5432}
  Start-Job {kubectl port-forward services/mars-bridge-service 30014:25578}
  Start-Jon {kubectl port-forward services/mars-earth-listener-service 30016:25578}
)

try {
  Write-Host "Port forwarding jobs running. Press Ctrl+C to stop..."
  $jobs |Wait-Job
}
finally {
  $jobs |Remove-Job -Force
}
