import sys 

nMaps = int(sys.stdin.readline())

for i in range(nMaps):
    xSize, ySize = map(int, sys.stdin.readline().strip().split())

    # read input in
    grid = [None for y in range(ySize)]

    for y in range(ySize):
        grid[y] = list(sys.stdin.readline().strip().split()) # essentially turning it back into what the generator generates before outputting 

    # setup for DFS + loop
    def rangeCheck(x,y):
        return (0 <= x < xSize) and (0 <= y < ySize)
    
    safeMin = lambda x,y: y if x is None else min(x, y)
    
    # DFS (that returns sum)
    def DFS(x,y):
        if not rangeCheck(x, y): # not on the grid (have to check or else indexing errors)
            return 0
        
        if grid[y][x] == ".": # ocean (or already searched)
            return 0

        # read off current val
        theSum = int(grid[y][x])

        # mark as searched
        grid[y][x] = "."

        # do rest of DFS
        theSum += DFS(x+1, y)
        theSum += DFS(x-1, y)
        theSum += DFS(x, y+1)
        theSum += DFS(x, y-1)

        return theSum
    
    # loop
    nIslands = 0
    minSum = None

    for y in range(ySize):
        for x in range(xSize):
            if grid[y][x] != ".":
                nIslands += 1
                minSum = safeMin(minSum, DFS(x,y))

    # output sol

    if minSum is None:
        minSum = "nil"
    else:
        minSum = str(minSum)

    sys.stdout.write(str(nIslands) + " " + minSum + "\n")
