import sys
import os


def get_cur_branch():
    result = os.popen('git branch').read()
    for branch_name in map(str.strip, result.split("\n")):
        if branch_name.startswith("*"):
            return branch_name.replace("*", "").strip()


def fetch(branch_name):
    cmd = "git fetch origin " + branch_name
    if branch_name == "all":
        cmd = "git fetch"

    if branch_name == "":
        cur_branch = get_cur_branch()
        cmd += cur_branch
    print cmd
    os.system(cmd)


if __name__ == "__main__":
    if len(sys.argv) == 1:
        fetch("")
    else:
        fetch(sys.argv[1])
