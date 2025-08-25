# Bulk remove injected environment variables using PowerShell

Get-Content "featureflags.txt" | ForEach-Object {
    if ($_ -match "^(.*?)=") {
        $key = $matches[1]
        # 删除当前用户的环境变量
        Remove-Item "Env:\$key" -ErrorAction SilentlyContinue
        # Windows 没有 setx 的删除命令，需手动从注册表移除
        Remove-ItemProperty -Path "HKCU:\Environment" -Name $key -ErrorAction SilentlyContinue
    }
}