from ShellOpen import shell_open
import sys


def search_wiki(query_str):
    url = "https://helixleisure.atlassian.net/wiki/dosearchsite.action?queryString=%s" % query_str
    print url
    shell_open(url)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print "Query string required\ne.g python SearchWiki 'GSP Settings'"
    else:
        search_wiki(sys.argv[1])