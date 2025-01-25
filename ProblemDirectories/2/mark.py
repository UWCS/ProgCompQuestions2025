import sys
import os

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
    Parses the input lines to extract the target sum and list of integers for each test case.

    Args:
        lines (List[str]): Lines from the input file.

    Returns:
        List[Tuple[int, List[int]]]: List of tuples where each tuple contains the target sum and the list of integers.
    """
    if not lines:
        return []

    idx = 0  # Initialize the current line index

    try:
        n = int(lines[idx])  # Number of test cases
        idx += 1
    except ValueError:
        print(f"Invalid number of test cases at line {idx + 1}. Expected an integer.")
        sys.exit(1)

    test_cases = []

    for tc in range(1, n + 1):
        # Check if there are enough lines left for the target, list length, and list elements
        if idx + 2 >= len(lines):
            print(f"Unexpected end of input while reading test case {tc}.")
            sys.exit(1)

        # Parse the target sum x
        try:
            x = int(lines[idx])
            idx += 1
        except ValueError:
            print(f"Invalid target value at line {idx + 1} for test case {tc}. Expected an integer.")
            sys.exit(1)

        # Parse the list length k
        try:
            k = int(lines[idx])
            idx += 1
        except ValueError:
            print(f"Invalid list length at line {idx + 1} for test case {tc}. Expected an integer.")
            sys.exit(1)

        # Parse the list of integers
        list_line = lines[idx].strip().split()
        if len(list_line) != k:
            print(
                f"List length mismatch at line {idx + 1} for test case {tc}. Expected {k} elements, got {len(list_line)}.")
            sys.exit(1)

        try:
            lst = list(map(int, list_line))
        except ValueError:
            print(f"Non-integer value found in list at line {idx + 1} for test case {tc}.")
            sys.exit(1)

        test_cases.append((x, lst))
        idx += 1  # Move to the next test case

    return test_cases


def parse_participant_output(lines, n):
    """
    Parses the participant's output lines.

    Args:
        lines (List[str]): Lines from the participant's output file.
        n (int): Number of test cases.

    Returns:
        List[str]: List of output strings for each test case.
    """
    outputs = []
    if len(lines) < n:
        print(f"Participant output has fewer lines ({len(lines)}) than expected ({n}).")
        sys.exit(1)
    for i in range(n):
        output = lines[i].strip()
        outputs.append(output)
    return outputs


def validate_output(target, lst, participant_output):
    """
    Validates the participant's output for a single test case.

    Args:
        target (int): The target sum.
        lst (List[int]): The list of integers.
        participant_output (str): The participant's output string.

    Returns:
        bool: True if the output is correct, False otherwise.
    """
    n = len(lst)
    # Precompute possible sublists of size 1 and 2
    valid_outputs = set()

    # Sublists of size 1
    for i in range(n):
        if lst[i] == target:
            valid_outputs.add(f'[{i + 1}]')

    # Sublists of size 2
    for i in range(n):
        for j in range(i + 1, n):
            if lst[i] + lst[j] == target:
                valid_outputs.add(f'[{i + 1},{j + 1}]')

    # Add "None" if no valid sublists
    if not valid_outputs:
        valid_outputs.add("None")

    return participant_output in valid_outputs


def main():
    # Ensure the correct number of command-line arguments
    if len(sys.argv) != 4:
        print("Usage: python compare_outputs.py <base_path> <jury_output_filename> <participant_output_filename>")
        print("Example: python compare_outputs.py ./test_cases 2subsetsum.out participant_file.txt")
        sys.exit(1)

    base_path = sys.argv[1]
    jury_output_filename = sys.argv[2]
    participant_output_filename = sys.argv[3]

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
    n = len(test_cases)

    # Read and parse the participant output file
    with open(participant_path, 'r') as file:
        participant_lines = file.read().splitlines()
    participant_outputs = parse_participant_output(participant_lines, n)

    # Initialize score
    score = 0

    # Iterate through each test case and validate
    for i in range(n):
        target, lst = test_cases[i]
        participant_output = participant_outputs[i]

        if validate_output(target, lst, participant_output):
            score += 1
        else:
            pass  # Optionally, print detailed debug info here

    # Print the final score
    print(score)


if __name__ == "__main__":
    main()
