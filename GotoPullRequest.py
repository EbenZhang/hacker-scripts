import sys
import GitHub.GetPullRequestUrl
from ShellOpen import shell_open


def go_to_pr(version, pr_num):
    url = GitHub.GetPullRequestUrl.get_pull_request_url("embedcard", "ecs6" if version == '6' else "ecs7", pr_num)
    print url
    shell_open(url)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print "repository version and pull request num required\ne.g python GotoPullRequest 6 100"
    else:
        go_to_pr(sys.argv[1], sys.argv[2])




