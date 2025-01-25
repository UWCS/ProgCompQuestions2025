FILE = "2subsetsum.txt"
OUTPUT = "output.txt"

f_in = open(FILE, "r")
with open(OUTPUT, "w") as f_out:

    n = int(f_in.readline())

    for i in range(n):
        x = int(f_in.readline())
        k = int(f_in.readline())
        raw_list = f_in.readline().split()

        for j in range(k):
            raw_list[j] = int(raw_list[j])

        raw_list2 = raw_list.copy()

        raw_list.sort()
        print(raw_list)

        found = False

        for j in range(k):
            if (raw_list2[j] == x):
                f_out.write("["+str(1+j)+"]" + "\n")
                found = True
                break

        if (found):
            continue

        lower = 0
        upper = k-1

        cum_sum = 0
        while (upper>=0 and  lower<k):
            cum_sum = raw_list[lower] + raw_list[upper]

            if (cum_sum == x): 

                lower = raw_list2.index(raw_list[lower])
                upper = raw_list2.index(raw_list[upper])

                newlower = min(lower, upper)
                newupper = max(lower, upper)


                
                f_out.write("["+str(1+newlower)+","+str(1+newupper)+"]\n")
                found = True
                break
            elif (cum_sum > x):
                upper -= 1
            elif (cum_sum < x):
                lower += 1
        
        if (not found):
            f_out.write("None\n")
