# PowerObfuscator

A PowerShell script obfuscator that uses mathematical operations and randomization to make scripts harder to read while maintaining functionality. Perfect for creating one-liners that can be run directly from the command line.

## Features

- Multiple obfuscation techniques:
  - Addition/Subtraction with random numbers
  - Multiplication/Division with random numbers
  - XOR operations with random numbers
- Maintains script functionality while making it harder to read
- Generates one-liners that can be run directly from CMD or PowerShell

## Usage

1. Place your PowerShell script in a file (e.g., `script.ps1`)
2. Run the obfuscator:
```powershell
. .\Invoke-Obfuscation.ps1
Invoke-Obfuscation -ScriptPath ".\script.ps1" -OutputPath ".\obfuscated.ps1"
```

## Examples

### 1. Running from CMD

```cmd
powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "IEX([char](7 -bxor 80)+[char](8306-8192)+[char](70 -bxor 47)+[char](8691-8575)+[char](56 -bxor 93)+[char](50 -bxor 31)+[char](1 -bxor 73)+[char](13 -bxor 98)+[char](6122-6007)+[char](6366-6250)+[char](9463-9431)+[char](204102/6003)+[char](7087-7015)+[char](501768/4968)+[char](344844/3193)+[char](12096/112)+[char](767010/6910)+[char](708-664)+[char](90 -bxor 122)+[char](2471-2384)+[char](6991-6880)+[char](80712/708)+[char](112 -bxor 28)+[char](1298-1198)+[char](181 -bxor 148)+[char](86 -bxor 116)+[char](4396-4386))"
```

### 2. Running from PowerShell

```powershell
IEX([char](7 -bxor 80)+[char](8306-8192)+[char](70 -bxor 47)+[char](8691-8575)+[char](56 -bxor 93)+[char](50 -bxor 31)+[char](1 -bxor 73)+[char](13 -bxor 98)+[char](6122-6007)+[char](6366-6250)+[char](9463-9431)+[char](204102/6003)+[char](7087-7015)+[char](501768/4968)+[char](344844/3193)+[char](12096/112)+[char](767010/6910)+[char](708-664)+[char](90 -bxor 122)+[char](2471-2384)+[char](6991-6880)+[char](80712/708)+[char](112 -bxor 28)+[char](1298-1198)+[char](181 -bxor 148)+[char](86 -bxor 116)+[char](4396-4386))
```

### 3. Running from a .ps1 file

1. Save the obfuscated output to a file:
```powershell
$obfuscated = "IEX([char](7 -bxor 80)+[char](8306-8192)+[char](70 -bxor 47)+[char](8691-8575)+[char](56 -bxor 93)+[char](50 -bxor 31)+[char](1 -bxor 73)+[char](13 -bxor 98)+[char](6122-6007)+[char](6366-6250)+[char](9463-9431)+[char](204102/6003)+[char](7087-7015)+[char](501768/4968)+[char](344844/3193)+[char](12096/112)+[char](767010/6910)+[char](708-664)+[char](90 -bxor 122)+[char](2471-2384)+[char](6991-6880)+[char](80712/708)+[char](112 -bxor 28)+[char](1298-1198)+[char](181 -bxor 148)+[char](86 -bxor 116)+[char](4396-4386))"
$obfuscated | Out-File script_obfuscated.ps1
```

2. Run the file:
```powershell
.\script_obfuscated.ps1
```

## Limitations

- Maximum command length in CMD is 8,191 characters
- Obfuscation increases script size by approximately 19x
- For large scripts, consider:
  - Using .ps1 files instead of direct command line
  - Splitting into multiple commands
  - Using download cradle techniques

## Example Files

- `hello.ps1`: Original "Hello, World!" script
- `hello_obfuscated.ps1`: Obfuscated version of the hello script
- `Invoke-Obfuscation.ps1`: The main obfuscator script
