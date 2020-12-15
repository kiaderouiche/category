import sys
from time import sleep
from gooey import Gooey, GooeyParser

@Gooey(progress_regex=r"^progress: (\d+)%$")
def main():
    parser = GooeyParser(prog="example_progress_bar")
    _ = parser.parse_args(sys.argv[1:])

    for i in range(100):
        print("progress: {}%".format(i+1))
        sleep(0.1)

if __name__ == "__main__":
    sys.exit(main())
