import sys
import os
from fractions import Fraction

def parse_lines_to_numbers(lines):
    """
    Splits each line into a list of numbers (as strings).

    Args:
        lines (List[str]): List of lines from a file.

    Returns:
        List[List[str]]: Nested list where each sublist contains the split numbers from a line.
    """
    return [line.strip().split() for line in lines if line.strip()]  # Split each line into a list of numbers

def parse_input_lines(lines):
    """
    Parses the input lines to extract p, q, u, v for each test case.

    Assumes the first line is t, followed by t lines each containing p q u v.

    Args:
        lines (List[str]): Lines from the input file.

    Returns:
        List[Tuple[int, int, int, int]]: List of tuples containing p, q, u, v for each test case.
    """
    if not lines:
        return []
    try:
        t = int(lines[0])
    except ValueError:
        print("First line of input file must be an integer representing the number of test cases.")
        sys.exit(1)
    test_cases = []
    for idx, line in enumerate(lines[1:t+1], start=2):
        parts = line.strip().split()
        if len(parts) != 4:
            print(f"Invalid format in input file at line {idx}. Expected 4 integers per test case.")
            sys.exit(1)
        try:
            p, q, u, v = map(int, parts)
            if q == 0 or v == 0:
                print(f"Denominator cannot be zero in test case at line {idx}.")
                sys.exit(1)
            test_cases.append( (p, q, u, v) )
        except ValueError:
            print(f"Non-integer value found in input file at line {idx}.")
            sys.exit(1)
    return test_cases

def main():
    # Ensure the correct number of command-line arguments
    if len(sys.argv) != 4:
        print("Usage: python compare_outputs.py <base_path> <jury_output_filename> <participant_output_filename>")
        sys.exit(1)

    #Assuming input file is same as output file (for jury)

    base_path = sys.argv[1]
    jury_output_filename = sys.argv[2]
    participant_output_filename = sys.argv[3]
    #input_filename = sys.argv[4]

    # Construct full paths to the files
    jury_path = os.path.join(base_path, "output", jury_output_filename)  # Path to jury solution
    participant_path = os.path.join(base_path, participant_output_filename)  # Path to participant solution
    input_path = os.path.join(base_path, "input", jury_output_filename)  # Path to input file

    # Check if all files exist
    if not os.path.isfile(jury_path):
        print(f"Jury output file not found: {jury_path}")
        sys.exit(1)
    if not os.path.isfile(participant_path):
        print(f"Participant output file not found: {participant_path}")
        sys.exit(1)
    if not os.path.isfile(input_path):
        print(f"Input file not found: {input_path}")
        sys.exit(1)

    # Read and parse the input file
    with open(input_path, 'r') as file:
        input_lines = file.read().splitlines()
    test_cases = parse_input_lines(input_lines)

    # Read and parse the jury output file
    with open(jury_path, 'r') as file:
        jury_lines = parse_lines_to_numbers(file.read().splitlines())

    # Read and parse the participant output file
    with open(participant_path, 'r') as file:
        participant_lines = parse_lines_to_numbers(file.read().splitlines())

    # Initialize score
    score = 0
    total = len(test_cases)

    # Iterate through each test case
    for i in range(total):
        # Ensure there are enough output lines
        if i >= len(jury_lines):
            print(f"Missing jury output for test case {i+1}.")
            continue
        if i >= len(participant_lines):
            print(f"Missing participant output for test case {i+1}.")
            continue

        # Extract p, q, u, v from the input
        p, q, u, v = test_cases[i]

        # Extract jury's fraction c/d
        jury_output = jury_lines[i]
        if len(jury_output) != 2:
            print(f"Invalid jury output format at test case {i+1}. Expected two integers.")
            continue
        try:
            c_j, d_j = map(int, jury_output)
            if d_j == 0:
                print(f"Jury fraction has denominator zero at test case {i+1}.")
                continue
        except ValueError:
            print(f"Non-integer values in jury output at test case {i+1}.")
            continue

        # Extract participant's fraction a/b
        participant_output = participant_lines[i]
        if len(participant_output) != 2:
            print(f"Invalid participant output format at test case {i+1}. Expected two integers.")
            continue
        try:
            a_p, b_p = map(int, participant_output)
            if b_p == 0:
                print(f"Participant fraction has denominator zero at test case {i+1}.")
                continue
        except ValueError:
            print(f"Non-integer values in participant output at test case {i+1}.")
            continue

        # Check if denominator matches
        if b_p != d_j:
            # Denominator does not match
            continue

        # Convert fractions to `Fraction` objects for accurate comparison
        try:
            participant_frac = Fraction(a_p, b_p)
            p_frac = Fraction(p, q)
            u_frac = Fraction(u, v)
        except ZeroDivisionError:
            print(f"Invalid fraction with zero denominator at test case {i+1}.")
            continue

        # Check if p/q < a/b < u/v
        if p_frac < participant_frac < u_frac:
            score +=1

    # Print the final score
    print(score)

if __name__ == "__main__":
    main()
