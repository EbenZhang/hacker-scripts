import sys
import os


def fetch_and_check_out(branch_name):
    cmd = "git fetch origin " + branch_name
    print cmd
    os.system(cmd)

    cmd = "git checkout " + branch_name
    print cmd
    os.system(cmd)

    cmd = "git reset origin/" + branch_name
    print cmd
    os.system(cmd)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "branch name required"
    else:
        fetch_and_check_out(sys.argv[1])

