# Init zoxide. Requires installation first.
Invoke-Expression (& { (zoxide init powershell | Out-String) })
# Init starship. Requires installation first.
Invoke-Expression (&starship init powershell)

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

# Make cd work like in linux
del alias:cd -Force # Remove builtin cd alias to Set-Location
function cd {
	$pwd = Get-Location
	# No args goes to home directory
	if ($args.Count -eq 0) {
		Set-Location ~
	# '-' as arg goes to previous directory
	} elseif ($args[0] -eq "-") {
		Set-Location @global:OLDPWD
	} else {
		Set-Location @args
	}
	$global:OLDPWD = $pwd
}

# Aliases -----------------------
# Neovim aliases
function vi { & nvim $args }
# Git aliases
function gs { & git status -- $args }
function gm { & git commit -m $args }
function gma { & git commit -am $args }
function g. { & git add . }
function gc { & git switch $args }
function root { & cd (git rev-parse --show-toplevel) }
# Edit powershell config
function prof { & nvim $profile }
