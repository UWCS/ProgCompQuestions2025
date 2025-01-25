import sys 

nTracks = int(sys.stdin.readline())

for i in range(nTracks):
    length = int(sys.stdin.readline())
    track = list(map(int, sys.stdin.readline().strip().split()))

    # manually compute base cases (alternative approach is to pad track with zeros at the end)
    prevPrevPrevOPT = track[length-1]
    prevPrevOPT = track[length-2]
    prevOPT = track[length-3] + max(0, prevPrevPrevOPT)

    # since the Mump could jump to a more optimal path that starts in the middle of the track 
    maxOPT = max(prevPrevPrevOPT, prevPrevOPT, prevOPT)

    for i in range(length-4, -1, -1):
        cOPT = track[i] + max(prevPrevOPT, prevPrevPrevOPT)
        maxOPT = max(maxOPT, cOPT)

        # update prevs 
        prevPrevPrevOPT = prevPrevOPT
        prevPrevOPT = prevOPT 
        prevOPT = cOPT

    sys.stdout.write(str(maxOPT) + "\n")
