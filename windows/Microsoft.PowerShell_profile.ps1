# Init zoxide. Requires installation first.
Invoke-Expression (& { (zoxide init powershell | Out-String) })
# Init starship. Requires installation first.
Invoke-Expression (&starship init powershell)

# Turn off autocomplete suggestions
Set-PSReadLineOption -PredictionSource None

# Wrapper for Yazi as provided by setup guide.
function y {
	$tmp = (New-TemporaryFile).FullName
	yazi.exe $args --cwd-file="$tmp"
	$cwd = Get-Content -Path $tmp -Encoding UTF8
	if ($cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
		Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
	}
	Remove-Item -Path $tmp
}


# Fuzzy-find a directory in the current git repo and cd into it
# (s)earch (r)epo
# converted from zsh with ChatGPT
function sr {
  git rev-parse --is-inside-work-tree *> $null
  if ($LASTEXITCODE -ne 0) {
    Write-Host "Not in a git repo"
    return
  }

  $repo = (git rev-parse --show-toplevel).Trim()
  $github = Join-Path $repo ".github"

  # All repo dirs, excluding:
  # - anything under .git
  # - anything under .github (we'll add back only its top-level dirs)
  $repoDirs = fd --type d --hidden --exclude .git --exclude '.github/*' . $repo

  # Only directories directly under .github (depth 1), if .github exists
  $githubTopDirs = @()
  if (Test-Path -LiteralPath $github) {
    $githubTopDirs = fd --type d --max-depth 1 . $github 2>$null
  }

  $dir = ($repoDirs + $githubTopDirs) | Sort-Object -Unique | fzf
  if ([string]::IsNullOrWhiteSpace($dir)) { return }

  Set-Location -- $dir.Trim()
}


# # Make cd work like in linux
# Not needed for PowerShell 7
# del alias:cd -Force # Remove builtin cd alias to Set-Location
# function cd {
# 	$pwd = Get-Location
# 	# No args goes to home directory
# 	if ($args.Count -eq 0) {
# 		Set-Location ~
# 	# '-' as arg goes to previous directory
# 	} elseif ($args[0] -eq "-") {
# 		Set-Location @global:OLDPWD
# 	} else {
# 		Set-Location @args
# 	}
# 	$global:OLDPWD = $pwd
# }

function vi { & nvim $args }
function lg { & lazygit $args }

function gs { & git status -- $args }
del alias:gm -Force # Remove builtin gm alias to Get-Member
function gm { & git commit -m $args }
function gma { & git commit -am $args }
function g. { & git add . }
function gc { & git switch $args }
function yeet { & git push }

function prof { & nvim $profile }

function root { & cd (git rev-parse --show-toplevel) }
