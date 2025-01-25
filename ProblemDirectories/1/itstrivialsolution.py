import sys 

nGames = int(sys.stdin.readline())

for i in range(nGames):
    target = int(sys.stdin.readline())
    nInstructions = int(sys.stdin.readline())

    for _ in range(nInstructions-1): # discard all turns except the last turn 
        sys.stdin.readline()
    
    finalLine = sys.stdin.readline() # the last turn (contains the winner)
    winner = finalLine[0]

    sys.stdout.write(winner + " wins\n")
