#!/usr/bin/env python3
import codecs
import sys


def apply_rot13(data):
    return codecs.encode(data, "rot13")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("No argument supplied."); exit(1)
    else:
        print(apply_rot13(sys.argv[1]))
        exit(0)

