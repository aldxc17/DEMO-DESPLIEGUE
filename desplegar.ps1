param(
    [string]$RutaPHP = 'php'
)

$archivoOrigen  = Join-Path -Path $PSScriptRoot 'origen\index.php'
$archivoDestino = Join-Path -Path $PSScriptRoot 'pruebas\index.php'

& $RutaPHP -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hay un error de sintaxis. No se publicó el cambio."
    exit 1
}

Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Versión publicada en el ambiente de pruebas."