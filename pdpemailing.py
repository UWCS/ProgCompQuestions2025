# script to format email addresses
import sys 

outputFile = "emailAddresses.txt"

# I don't know if combinators are in Python, but transform is the equivalent of int.strip
def transform(x):
    return int(x.strip())

ids = set(map(transform, sys.stdin.readlines()))

with open(outputFile, "w") as outFile:
    for id in ids:
        outFile.write(f"u{id}@live.warwick.ac.uk;")
