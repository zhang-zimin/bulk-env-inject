# Bulk inject environment variables using PowerShell
$envVars = @{}
Get-Content "featureflags.txt" | ForEach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
        $envVars[$matches[1]] = $matches[2]
    }
}

foreach ($key in $envVars.Keys) {
    Write-Host "Injecting feature: $key=$($envVars[$key])"
    $output = setx $key $envVars[$key]
    Write-Host $output
}