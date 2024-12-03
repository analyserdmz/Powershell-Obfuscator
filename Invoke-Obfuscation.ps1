function Get-RandomTransform {
    param([char]$char)
    
    $methods = @(
        {
            param($c)
            $rand = Get-Random -Minimum 1 -Maximum 10001
            "[char]($($rand+$c)-$rand)"
        },
        {
            param($c)
            $rand = Get-Random -Minimum 1 -Maximum 10001
            "[char]($($c*$rand)/$rand)"
        },
        {
            param($c)
            $rand = Get-Random -Minimum 1 -Maximum 256
            "[char]($($c -bxor $rand) -bxor $rand)"
        }
    )
    
    $method = Get-Random -InputObject $methods
    & $method $char.ToInt16($null)
}

function Invoke-Obfuscation {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ScriptPath,
        [Parameter(Mandatory=$true)]
        [string]$OutputPath
    )

    Write-Host "Processing script..."
    $script = Get-Content -Path $ScriptPath -Raw
    Write-Host "Script content: $script"
    $obfuscated = @()
    
    foreach($char in $script.ToCharArray()) {
        $obfuscated += Get-RandomTransform $char
    }
    
    $joined = $obfuscated -join "+"
    
    $finalObfuscated = "IEX($joined)"
    
    $finalObfuscated | Out-File -FilePath $OutputPath -Encoding UTF8
    
    Write-Host "Script obfuscated successfully!"
    Write-Host "Original size: $($script.Length) bytes"
    Write-Host "Obfuscated size: $($finalObfuscated.Length) bytes"
    Write-Host "Obfuscated content:"
    Write-Host $finalObfuscated
}
