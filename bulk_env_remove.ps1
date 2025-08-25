# Bulk remove injected environment variables using PowerShell

Get-Content "featureflags.txt" | ForEach-Object {
    if ($_ -match "^(.*?)=") {
        $key = $matches[1]
        Remove-Item "Env:\$key" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path "HKCU:\Environment" -Name $key -ErrorAction SilentlyContinue
    }
}