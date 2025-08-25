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

## 使用方法

1. **编辑 featureflags.txt**  
   按需添加或修改功能开关，每行一个，格式为 `key=value`。

2. **运行 PowerShell 脚本**  
   在命令行中进入脚本所在目录，执行：
   ```powershell
   .\bulk_env_inject.ps1
   ```
   该脚本会自动读取 `featureflags.txt`，并将所有键值对注入为环境变量（永久生效）。

## 注意事项

- 运行脚本后，新的环境变量可能需要重启终端或注销后才能生效。
- 环境变量仅对当前用户有效。
- 请确保 `featureflags.txt` 文件与脚本在同一目录下，或修改脚本中的路径。

## 示例

`featureflags.txt` 内容：
```
civil-imodel-connector-cifconverterv2=0
allow-hypermodeling=1
```

运行脚本后，系统环境变量将包含：
- `civil-imodel-connector-cifconverterv2=0`
- `allow-hypermodeling=1`