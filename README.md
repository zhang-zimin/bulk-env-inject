# Feature Flags 管理与批量注入

## 文件说明

- `featureflags.txt`  
  存放所有功能开关（feature flags），每行格式为：  
  ```
  功能名=值
  ```
  例如：
  ```
  civil-imodel-connector-cifconverterv2=0
  allow-hypermodeling=1
  ```

- `bulk_env_inject.ps1`  
  PowerShell 脚本，用于批量读取 `featureflags.txt` 并注入为当前用户的环境变量。

- `bulk_env_remove.ps1`  
  PowerShell 脚本，用于批量移除 `featureflags.txt` 中定义的所有环境变量。

## 使用方法

1. **编辑 featureflags.txt**  
   按需添加或修改功能开关，每行一个，格式为 `key=value`。

2. **批量注入环境变量**  
   在命令行中进入脚本所在目录，执行：
   ```powershell
   .\bulk_env_inject.ps1
   ```
   该脚本会自动读取 `featureflags.txt`，并将所有键值对注入为环境变量（永久生效）。

3. **批量撤销环境变量**  
   如需移除所有注入的环境变量，执行：
   ```powershell
   .\bulk_env_remove.ps1
   ```
   该脚本会自动删除 `featureflags.txt` 中所有定义的环境变量。

## 注意事项

- 运行脚本后，新的环境变量可能需要重启终端或注销后才能生效。
- 环境变量仅对当前用户有效。
- 请确保 `featureflags.txt` 文件与脚本在同一目录下，或修改脚本中的路径。
- Windows 没有 setx 的删除命令，`bulk_env_remove.ps1` 会直接从注册表移除相关项。

## 示例

`featureflags.txt` 内容：
```
civil-imodel-connector-cifconverterv2=0
allow-hypermodeling=1
```

运行注入脚本后，系统环境变量将包含：
- `civil-imodel-connector-cifconverterv2=0`
- `allow-hypermodeling=1`

运行撤销脚本后，这些环境变量将被移除。