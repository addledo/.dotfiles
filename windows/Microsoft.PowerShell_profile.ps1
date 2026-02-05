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

function gs { & git status -- $args }
del alias:gm -Force # Remove builtin gm alias to Get-Member
function gm { & git commit -m $args }
function gma { & git commit -am $args }
function g. { & git add . }
function gc { & git switch $args }
function yeet { & git push }

function prof { & nvim $profile }

function sd {}
function root { & cd (git rev-parse --show-toplevel) }
