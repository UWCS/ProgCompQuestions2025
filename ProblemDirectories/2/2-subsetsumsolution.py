# 2-subsetsum solution
import sys 

n = int(sys.stdin.readline())

for i in range(n):
    total = int(sys.stdin.readline())
    nToDiscard = sys.stdin.readline()

    candidates = list(map(int, sys.stdin.readline().split(" ")))

    hashMap = {} # stores total - value as key, with index as value (makes it easy to lookup if you later find total - value later in the list)
    found = False 

    for j in range(len(candidates)):
        curCandidate = candidates[j] # value being inspected

        if curCandidate == total:
            sys.stdout.write('[' + str(j+1) + ']\n')
            found = True
            break
        elif curCandidate in hashMap:
            sys.stdout.write('[' + str(hashMap[curCandidate]+1) + ',' + str(j+1) + ']\n')
            found = True
            break

        hashMap[total - curCandidate] = j

    if not found:
        sys.stdout.write('None\n')
