#!/usr/bin/env python3
import codecs
import sys

if len(sys.argv) != 2:
    print("No argument supplied."); exit(1)
else:
    print(codecs.encode(sys.argv[1], "rot13"))
    exit(0)

