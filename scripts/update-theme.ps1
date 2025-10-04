# Theme Update Automation Script
# This script pulls upstream theme updates and preserves our accessibility improvements

param(
    [switch]$DryRun,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$ThemePath = "themes/PaperMod"

Write-Host "🔄 Starting PaperMod theme update..." -ForegroundColor Cyan

# Navigate to main directory
if (-not (Test-Path ".git")) {
    Write-Error "Git repository not found. Run from project root directory."
}

# Navigate to theme directory
Push-Location $ThemePath

try {
    # Check branch - avoid detached HEAD
    $CurrentBranch = git branch --show-current
    if ([string]::IsNullOrEmpty($CurrentBranch) -or $CurrentBranch -ne "master") {
        Write-Host "⚠️  Switching to master branch (detached HEAD fix)..." -ForegroundColor Yellow
        git checkout master
        git pull origin master
    }
    
    Write-Host "📥 Fetching upstream changes..." -ForegroundColor Yellow
    
    # Add upstream remote (if not exists)
    $Remotes = git remote
    if ($Remotes -notcontains "upstream") {
        git remote add upstream https://github.com/adityatelange/hugo-PaperMod.git
    }
    
    # Fetch latest changes from upstream
    git fetch upstream
    
    # Save current commit hashes
    $CurrentCommit = git rev-parse HEAD
    $UpstreamCommit = git rev-parse upstream/master
    
    if ($CurrentCommit -eq $UpstreamCommit) {
        Write-Host "✅ Theme is already up to date!" -ForegroundColor Green
        return
    }
    
    Write-Host "🔀 Merging upstream changes..." -ForegroundColor Yellow
    Write-Host "   Current: $($CurrentCommit.Substring(0,8))" -ForegroundColor Gray
    Write-Host "   Upstream: $($UpstreamCommit.Substring(0,8))" -ForegroundColor Gray
    
    if ($DryRun) {
        Write-Host "🧪 DRY RUN: Changes will not be applied" -ForegroundColor Magenta
        git diff HEAD upstream/master --name-only | ForEach-Object {
            Write-Host "   Changed file: $_" -ForegroundColor Gray
        }
        return
    }
    
    # Save our accessibility improvements
    $OurFiles = @(
        "layouts/_default/baseof.html",
        "layouts/partials/header.html", 
        "layouts/partials/footer.html",
        "layouts/partials/toc.html"
    )
    
    # Create temporary backup
    $BackupDir = "$env:TEMP/papermod-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
    
    foreach ($file in $OurFiles) {
        if (Test-Path $file) {
            $destDir = Join-Path $BackupDir (Split-Path $file -Parent)
            New-Item -ItemType Directory -Path $destDir -Force | Out-Null
            Copy-Item $file -Destination (Join-Path $BackupDir $file) -Force
        }
    }
    
    # Merge upstream changes
    $MergeOutput = git merge upstream/master --no-edit 2>&1
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "⚠️  Conflict detected, restoring our accessibility code..." -ForegroundColor Yellow
        
        # Restore our files
        foreach ($file in $OurFiles) {
            $backupFile = Join-Path $BackupDir $file
            if (Test-Path $backupFile) {
                Copy-Item $backupFile -Destination $file -Force
                Write-Host "   ✅ $file - our version restored" -ForegroundColor Green
            }
        }
        
        # Resolve conflicts
        git add .
        git commit -m "chore: merge upstream with accessibility improvements preserved"
    }
    
    # Push to our fork
    Write-Host "📤 Pushing to fork..." -ForegroundColor Yellow
    git push origin master
    
    # Clean up backup directory
    Remove-Item $BackupDir -Recurse -Force
    
    Write-Host "✅ Theme updated successfully!" -ForegroundColor Green
    
} catch {
    Write-Error "❌ Error: $($_.Exception.Message)"
} finally {
    Pop-Location
}

# Update submodule in main project
Write-Host "🔄 Updating submodule in main project..." -ForegroundColor Cyan
git add themes/PaperMod

# Commit if there are changes
$Status = git status --porcelain themes/PaperMod
if ($Status) {
    git commit -m "chore: update PaperMod theme to latest version"
    Write-Host "🎉 All updates completed!" -ForegroundColor Green
} else {
    Write-Host "ℹ️  No updates needed in main project" -ForegroundColor Blue
}

Write-Host "💡 To test: hugo server -D" -ForegroundColor Cyan