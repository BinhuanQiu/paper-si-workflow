# Install the bundled skill without replacing an existing installation.
# Usage: powershell -NoProfile -File .\install.ps1
# Preview: powershell -NoProfile -File .\install.ps1 -WhatIf
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$SkillRoot
)

$ErrorActionPreference = 'Stop'
$skillName = 'paper-si-workflow'
$source = Join-Path $PSScriptRoot ('skills/' + $skillName)

if ([string]::IsNullOrWhiteSpace($SkillRoot)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $SkillRoot = Join-Path $env:CODEX_HOME 'skills'
    } else {
        $SkillRoot = Join-Path (Join-Path $HOME '.codex') 'skills'
    }
}

$root = [System.IO.Path]::GetFullPath($SkillRoot)
$destination = Join-Path $root $skillName

# Explicit allowlist: never install repository data, logs or user files.
# Copy SKILL.md last so incomplete preparation is not discoverable as a skill.
$files = @(
    'agents/openai.yaml',
    'references/ablesci.md',
    'references/manifest.md',
    'assets/tasks.example.csv',
    'assets/manifest.example.json',
    'SKILL.md'
)

foreach ($relative in $files) {
    if (-not (Test-Path -LiteralPath (Join-Path $source $relative) -PathType Leaf)) {
        throw "Missing bundled file: $relative. Extract the complete repository archive first."
    }
}

if (Test-Path -LiteralPath $destination) {
    throw "An installation already exists at $destination. Nothing was changed. Choose another -SkillRoot or arrange an explicit update."
}

if ($PSCmdlet.ShouldProcess($destination, 'Install paper-si-workflow from the bundled files')) {
    if (-not (Test-Path -LiteralPath $root)) {
        New-Item -ItemType Directory -Path $root -Force | Out-Null
    }

    # No -Force: an existing installation must never be reused or overwritten.
    New-Item -ItemType Directory -Path $destination | Out-Null

    try {
        foreach ($relative in $files) {
            $target = Join-Path $destination $relative
            $parent = Split-Path -Parent $target
            if (-not (Test-Path -LiteralPath $parent)) {
                New-Item -ItemType Directory -Path $parent | Out-Null
            }
            Copy-Item -LiteralPath (Join-Path $source $relative) -Destination $target -ErrorAction Stop
        }
        Write-Output "Installed skill files: $destination"
        Write-Output 'Open a new client task or refresh its skill discovery, then invoke $paper-si-workflow.'
        Write-Output 'Browser connection and account login are separate from skill installation.'
    } catch {
        Write-Warning "Installation did not complete. Any files already copied were left at $destination; no previous installation was removed."
        throw
    }
}
