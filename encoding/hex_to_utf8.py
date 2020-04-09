#!/usr/bin/env python3
import sys


def decode_hex_to_ut8(data):
    try:
        return bytearray.fromhex(data).decode("UTF-8")
    except ValueError:
        return "Error when parsing hex string -- Check that it's valid."


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("No argument supplied."); exit(1)
    else:
        print(decode_hex_to_ut8(sys.argv[1]))

