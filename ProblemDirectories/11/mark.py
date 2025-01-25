import sys
import os

jury_path = os.path.join(sys.argv[1], "output", sys.argv[2])  # Path to jury solution
participant_path = sys.argv[3]  # Path to participant solution

def parse_lines_to_numbers(lines):
    return [line.split() for line in lines]  # Split each line into a list of numbers

with open(jury_path) as file:
    jury_lines = parse_lines_to_numbers(file.read().splitlines())

with open(participant_path) as file:
    participant_lines = parse_lines_to_numbers(file.read().splitlines())

score = 0
total = max(len(jury_lines), len(participant_lines))

for jury_line, participant_line in zip(jury_lines, participant_lines):
    if jury_line == participant_line:
        score += 1

print(score)
