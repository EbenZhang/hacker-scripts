# git fetch a branch
function gf([string]$branch) {
    Write-Host "fetching $branch"
    & git fetch origin $branch
    if($LASTEXITCODE -ne 0) {
        throw "Failed to fetch branch $branch"
    }
}

# git fetch and checkout branch
function gfc([string]$branch) {
    gf -branch $branch

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
        & git branch -D $branch
        
        & git checkout -f -b $branch "origin/$branch"
    }
}
