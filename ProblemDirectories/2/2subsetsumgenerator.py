import random

inputFile = "a.in"
# outputFile = "b.out"
cases = 100

nValStart = 0 # range of input values (start)
nValEnd = 100000 # range of input values (end)

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
    inp.write(str(cases) + "\n") # write the number of cases

    for _ in range(cases):
        # generate either no solution, solution with |subset|=1, solution with |subset|=2
        target = random.randint(1000, 100000)
        nNumbers = random.randint(8, 140)

        nums = [0] * nNumbers

        for i in range(nNumbers):
            nums[i] = random.randint(nValStart, nValEnd)
        
        # if there's a natural solution, we'll let it be 
        if solution(nums, target):
            inp.write(str(target) + "\n" + str(nNumbers) + "\n")
            nums = map(str, nums)
            inp.write(" ".join(nums) + "\n")
            continue 
        
        problemRnd = random.random()

        if problemRnd < 0.3: # generate |subset|=1 solution (by setting)
            rndIndex = random.randint(0, nNumbers-1)
            nums[rndIndex] = target
        elif problemRnd < 0.8: # generate |subset|=2 solution (by changing target)
            rndIndex1 = random.randint(0, nNumbers-1)
            rndIndex2 = random.randint(0, nNumbers-2)

            if rndIndex2 >= rndIndex1:
                rndIndex2 += 1

            target = nums[rndIndex1] + nums[rndIndex2]
        
        nums = map(str, nums)
        inp.write(str(target) + "\n" + str(nNumbers) + "\n")
        inp.write(" ".join(nums) + "\n")
