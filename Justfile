set shell := ["sh", "-c"]
set windows-shell := ["pwsh.exe", "-c"]

export PROJECT_NAME := "reborn-furni"

package: bundle
    darklua minify out/{{ PROJECT_NAME }}.lua out/{{ PROJECT_NAME }}.min.lua

bundle:
    darklua process ./src/main.lua out/{{ PROJECT_NAME }}.lua

lint:
	selene $(git ls-files | rg '\.lua')

format:
    stylua --glob '**/*.lua' -- src
