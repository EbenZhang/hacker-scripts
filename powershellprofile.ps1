
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadline
    Import-Module posh-git
    try{
        Set-PSReadlineOption -EditMode vi
        Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Insert
        Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Command
        Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
        Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
        Set-PSReadLineKeyHandler -Key Tab -Function Complete
        $GitPromptSettings.EnableFileStatus = $false
    } catch{}
}

function c7() {
    $oldDir = pwd
    Write-Host $oldDir
    Set-Variable -Name OLDPWD -Value $oldDir -Scope global;
    set-location "f:\projects\ecs7"
}

function np() {
    & "C:\Program Files (x86)\Notepad++\notepad++.exe" $args
}

set-alias vim gvim.exe
set-alias vi vim

# open a github pull request in default browser
function p([int]$prNumber) {
    & start "https://github.com/embedcard/ecs7/pull/$prNumber" 
}

# open a jira issue in default browser
function j([string]$jiraIssue) {
    & start "https://helixleisure.atlassian.net/browse/$jiraIssue" 
}

. $PSScriptRoot/git.ps1

function msbuild() {
    msbuild.exe "/t:restore;build" /m $args
}

# build debug version, usage: bd your.sln
function bd() {
    msbuild.exe "/t:restore;build" /m /p:Configuration=Debug $args
}

# build release version, usage: br your.sln
function br() {
    msbuild.exe "/t:restore;build" /m /p:Configuration=Release $args
}

# build the dbwizard schema
function bs() {
    $oldDir = pwd
    Set-Variable -Name OLDPWD -Value $oldDir -Scope global;
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

set-alias which where.exe
