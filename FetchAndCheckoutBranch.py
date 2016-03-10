import sys
import os


def fetch_and_check_out(branch_name):
    cmd = "git fetch origin " + branch_name
    print cmd
    os.system(cmd)

    result = os.popen('git status -s --untracked-files=no').read()
    if result != "":
        print result
        choice = str(raw_input("You have uncommitted local changes. Press 'Y' to continue."))
        if not choice.upper().startswith('Y'):
            return
    cmd = "git checkout " + branch_name
    print cmd
    os.system(cmd)

    cmd = "git reset --hard origin/" + branch_name
    print cmd
    os.system(cmd)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "branch name required"
    else:
        fetch_and_check_out(sys.argv[1])

