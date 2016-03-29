import sys
import os


def fetch_and_check_out(remote_branch_name, new_branch_name):
    cmd = "git fetch origin " + remote_branch_name
    print cmd
    os.system(cmd)

    result = os.popen('git status -s --untracked-files=no').read()
    if result != "":
        print result
        choice = str(raw_input("You have uncommitted local changes. Press 'Y' to continue."))
        if not choice.upper().startswith('Y'):
            return

    cmd = "git branch -D " + new_branch_name
    print cmd
    os.system(cmd)

    cmd = "git checkout -f -b " + new_branch_name + " origin/" + remote_branch_name
    print cmd
    os.system(cmd)

    cmd = "git reset --hard origin/" + remote_branch_name
    print cmd
    os.system(cmd)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print "branch name required"
    elif len(sys.argv) == 2:
        fetch_and_check_out(sys.argv[1], sys.argv[1])
    elif len(sys.argv) == 3:
        fetch_and_check_out(sys.argv[1], sys.argv[2])

