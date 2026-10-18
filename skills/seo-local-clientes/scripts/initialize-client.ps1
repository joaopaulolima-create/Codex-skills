[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[a-z0-9]+(?:-[a-z0-9]+)*$')]
    [string]$ClientSlug,

    [Parameter(Mandatory = $true)]
    [string]$RootPath,

    [string]$ClientName
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ClientName)) {
    $ClientName = $ClientSlug -replace '-', ' '
}

if (-not (Test-Path -LiteralPath $RootPath)) {
    New-Item -ItemType Directory -Path $RootPath | Out-Null
}

$resolvedRoot = (Resolve-Path -LiteralPath $RootPath).Path
$rootPrefix = [System.IO.Path]::GetFullPath($resolvedRoot).TrimEnd('\', '/') + [System.IO.Path]::DirectorySeparatorChar
$targetPath = [System.IO.Path]::GetFullPath((Join-Path $resolvedRoot $ClientSlug))

if (-not $targetPath.StartsWith($rootPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "O destino calculado saiu da pasta raiz informada."
}

if (Test-Path -LiteralPath $targetPath) {
    throw "A pasta do cliente ja existe e nao sera sobrescrita: $targetPath"
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$assetsPath = Join-Path $skillRoot 'assets'
$templates = @(
    @{ Source = 'client-brief.md'; Destination = '00-briefing.md' },
    @{ Source = 'plan-30-days.md'; Destination = '01-plano-30-dias.md' },
    @{ Source = 'activity-log.md'; Destination = '02-registro-atividades.md' },
    @{ Source = 'launch-checklist.md'; Destination = '03-checklist-lancamento.md' },
    @{ Source = 'final-report.md'; Destination = '04-relatorio-final.md' },
    @{ Source = 'onboarding-form.md'; Destination = '05-formulario-onboarding.md' }
)

foreach ($template in $templates) {
    $sourcePath = Join-Path $assetsPath $template.Source
    if (-not (Test-Path -LiteralPath $sourcePath)) {
        throw "Template nao encontrado: $sourcePath"
    }
}

New-Item -ItemType Directory -Path $targetPath | Out-Null

foreach ($template in $templates) {
    $sourcePath = Join-Path $assetsPath $template.Source
    $destinationPath = Join-Path $targetPath $template.Destination
    Copy-Item -LiteralPath $sourcePath -Destination $destinationPath

    $content = Get-Content -Raw -LiteralPath $destinationPath
    $content = $content.Replace('[nome comercial]', $ClientName).Replace('[cliente]', $ClientName)
    Set-Content -LiteralPath $destinationPath -Value $content -Encoding UTF8
}

[PSCustomObject]@{
    ClientName = $ClientName
    ClientSlug = $ClientSlug
    Path = $targetPath
    Files = @($templates.Destination)
}
