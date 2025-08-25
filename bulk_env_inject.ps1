# Bulk inject environment variables using PowerShell
$envVars = @{}
Get-Content "featureflags.txt" | ForEach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
        $envVars[$matches[1]] = $matches[2]
    }
}

# Or use setx for permanent user environment variables
foreach ($key in $envVars.Keys) {
    setx $key $envVars[$key]
}
