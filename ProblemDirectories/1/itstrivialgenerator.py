import random

inputFile = "b.in"
outputFile = "b.out"
nGames = 400 # 1 <= nGames <= 800

p1 = "R"
p2 = "A"

def solution(nums, target):
    hashMap = {} # stores total - value as key, with index as value (makes it easy to lookup if you later find total - value later in the list)

    for j in range(len(nums)):
        curCandidate = nums[j] # value being inspected

        if curCandidate == target:
            return True
        elif curCandidate in hashMap:
            return True

        hashMap[target - curCandidate] = j

    return False 

with open(inputFile,"w") as inp:
    with open(outputFile, "w") as out:
        inp.write(str(nGames) + "\n") # write number of games

        for _ in range(nGames):
            # for each game, generate k and m
            k = random.randint(1, 200)

            # we know m >= 2k - 1
            m = random.randint(2*k - 1, 1000)

            # flip coin to see whether p1 or p2 goes first
            coin = random.randint(0, 1)
            fpChar = p1 if coin == 0 else p2
            spChar = p2 if coin == 0 else p1

            # if m % 2 == 0 then we know second person wins and m/2 turns each
            # if m % 2 == 1 then we know first person wins and first person has m/2 + 1, second person has m/2
            fpTurns, spTurns = 0, 0 # total turns for each person
            fpTTurns, fpNTurns = 0, 0 # 1st person trivial turns, non-trivial turns
            spTTurns, spNTurns = 0, 0 # 2nd person trivial turns, non-trivial turns

            if m % 2 == 0: # second person wins
                fpTurns = m//2
                spTurns = m//2

                spTTurns = k
                fpTTurns = random.randint(0, min(fpTurns, k-1))

                out.write(f"{spChar} wins\n")
            else: # first person wins
                fpTurns = m//2 + 1
                spTurns = m//2

                fpTTurns = k
                spTTurns = random.randint(0, min(spTurns, k-1))

                out.write(f"{fpChar} wins\n")

            # calculate non-trivial turns as total turns - trivial turns
            fpNTurns = fpTurns - fpTTurns 
            spNTurns = spTurns - spTTurns

            # create array for fp turns, sp turns
            fpTurnsArray = [f"{fpChar}: it is trivial"] * fpTTurns
            fpTurnsArray += [f"{fpChar}: it is not trivial"] * fpNTurns 
            random.shuffle(fpTurnsArray)
            print(m, len(fpTurnsArray))

            spTurnsArray = [f"{spChar}: it is trivial"] * spTTurns
            spTurnsArray += [f"{spChar}: it is not trivial"] * spNTurns
            random.shuffle(spTurnsArray)
            print(m, len(spTurnsArray))

            # join them together 
            turnsArray = [fpTurnsArray[i//2] if i % 2 == 0 else spTurnsArray[i//2] for i in range(m)] # index 0 corresponds to fp, 1 to sp ...

            # output
            inp.write(str(k) + "\n" + str(m) + "\n")
            inp.write("\n".join(turnsArray) + "\n")
