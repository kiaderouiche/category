from gooey import Gooey, GooeyParser
import sys

@Gooey
def the_goo():
    goo = GooeyParser(description="Addition")
    goo.add_argument('Digit 1')
    goo.add_argument('Digit 2')

    goo.parse_args()
    digit_1 = sys.argv[2]
    digit_2 = sys.argv[3]
    print(digit_1)
    print(digit_2)
    print(f"{digit_1} + {digit_2} = ", int(digit_1) + int(digit_2))

the_goo()

