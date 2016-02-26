from ShellOpen import shell_open
import sys


def go_to_tfs(item_id):
    url = "http://was21:8080/tfs/Embed/ECS/_workitems#_a=edit&id=%s" % item_id
    print url
    shell_open(url)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "TFS item num required\ne.g python GotoTFS 28250"
    else:
        go_to_tfs(sys.argv[1])

