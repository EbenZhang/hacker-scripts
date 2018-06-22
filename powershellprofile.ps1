
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PsGet
    Import-Module PSReadline
    Import-Module posh-git
    try{
        Set-PSReadlineOption -EditMode vi
        Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Insert
        Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Command
        Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
        Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
        Set-PSReadLineKeyHandler -Key Tab -Function Complete
    } catch{}
}

function c7 {
    set-location "f:\projects\ecs7"
}

function msbuild{
    msbuild.exe "/t:restore;build" /m $args
}

function np {
    & "C:\Program Files (x86)\Notepad++\notepad++.exe" $args
}

set-alias vim gvim.exe

function p([int]$prNumber) {
    & start "https://github.com/embedcard/ecs7/pull/$prNumber" 
}

function gfc([string]$branch) {
    Write-Host "fetching $branch"
    & git fetch origin $branch
    if($LASTEXITCODE -ne 0) {
        Exit $LASTEXITCODE
    }
    $uncommited = & git status -s --untracked-files=no
    if(![string]::IsNullOrWhiteSpace($uncommited)) {
        $choice = Read-Host -Prompt "You have uncommitted local changes. Press 'Y' to continue."

        if($choice -ne "Y") {
            return
        }

    }

    $curBranch = & git rev-parse --abbrev-ref HEAD
    if($curBranch -eq $branch) {
        & git reset --hard origin/$branch
    } else {        
        & git checkout -f -b $branch "origin/$branch"
    }
}

function bd() {
    msbuild.exe "/t:restore;build" /m /p:Configuration=Debug
}

function br() {
    msbuild.exe "/t:restore;build" /m /p:Configuration=Release
}

function bs() {
    Set-Location F:\projects\ecs7\Database\Embed.ECS.DatabaseWizard
    & .\BuildWithSchemaChanges.bat
}
if(test-path alias:cd) {
    Remove-Item Alias:cd
}

function cd {
    if ($args[0] -eq '-') {
        $pwd=$OLDPWD;
    } else {
        $pwd=$args[0];
    }
    
    $tmp=pwd;
    
    if ($pwd) {
        Set-Location $pwd;
    }
    
    Set-Variable -Name OLDPWD -Value $tmp -Scope global;
}
