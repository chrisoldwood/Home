[CmdletBinding()]
param (
    [Parameter()]
    [string] $File
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$fixups = @(
    @{ Pattern = '@font-face\s*\{[^\}]*\}'; Replacement = '' },
    @{ Pattern = 'font-family\s*:\s*[^;\}\r\n]+;'; Replacement = '' },
    @{ Pattern = 'font-size:11.0pt;'; Replacement = 'font-size: 13.0pt;' },
    @{ Pattern = 'width: 600px;'; Replacement = 'width: 700px;' }
    @{ Pattern = 'Afterwood\s*[-–]\s*'; Replacement = 'Afterwood – ' }
)

$encoding = [System.Text.Encoding]::GetEncoding(1252)
$content = [System.IO.File]::ReadAllText($File, $encoding)
foreach ($fixup in $fixups) {
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, $fixup.Pattern, $fixup.Replacement, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
}
[System.IO.File]::WriteAllText($File, $content, $encoding)
