import sys

# print notices in green
def notice(msg):
    print("\033[32m" + msg + "\033[0m")

# print warnings in yellow
def warning(msg):
    print("\033[33m" + msg + "\033[0m")

# print error in red and exit
def error(msg):
    print("\033[31m" + msg + "\033[0m")
    sys.exit(1)
