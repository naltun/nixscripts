#!/usr/bin/env python3
import sys

if len(sys.argv) != 2:
    print("No argument supplied."); exit(1) 
print(f"UTF-8 encoding: {bytearray.fromhex(sys.argv[1]).decode('UTF-8')}")
