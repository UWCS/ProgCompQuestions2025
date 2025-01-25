import sys
import os

sample_path = os.path.join(sys.argv[1], "output", sys.argv[2])

with open(sample_path) as file:
    sample_lines = file.read().splitlines()

with open(sys.argv[3]) as file:
    output_lines = file.read().splitlines()

# Marking Style: Get the number of sample/output lines that match

score = 0

for target_line, actual_line in zip(sample_lines, output_lines):
    if target_line == actual_line:
        score += 1

print(score)
