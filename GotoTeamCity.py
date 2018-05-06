import sys
from ShellOpen import shell_open


def go_to_ci(version, pr_num):
    url_format = 'http://was21.embint.local:8111/viewType.html?buildTypeId=%s%s&tab=buildTypeStatusDiv'
    build_type = 'EcsV7_Git_CiBuild&branch_EcsV7_Git=' if version == 7 else 'EcsV6_Git_CiBuild&branch_EcsV6_Git='
    url = url_format % (build_type, pr_num)
    print url
    shell_open(url)


def go_to_release(version, pr_num):
    url_format = 'http://was21.embint.local:8111/viewType.html?buildTypeId=%s%s&tab=buildTypeStatusDiv'
    build_type = 'EcsV7_Git_CiBuild&branch_EcsV7_Git=' if version == 7 else 'EcsV6_Git_CiBuild&branch_EcsV6_Git='
    url = url_format % (build_type, pr_num)
    print url
    shell_open(url)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "repository version and pull request num required\ne.g python GotoTeamCity 6 100"
    else:
        go_to_ci(sys.argv[1], sys.argv[2])
