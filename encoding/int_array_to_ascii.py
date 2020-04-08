#!/usr/bin/env python3
import sys

if len(sys.argv) != 2:
    print("No argument supplied."); exit(1)
else:
    payload = sys.argv[1].strip("[").strip("]").split(",")

decoded_msg = ""
for num in payload:
    decoded_msg += chr(int(num))

print(f"All done. ASCII encoding is: {decoded_msg}")
exit(0)

