import random

inputFile = "d.in"
nTracks = 3000 # 1 <= nTracks <= 2000

with open(inputFile,"w") as inp:
    inp.write(str(nTracks) + "\n")

    for i in range(nTracks):
        # gen length of track
        l = random.randint(450, 3000)
        
        inp.write(str(l) + "\n")

        # gen track itself
        x = random.randint(-1000, 1000)
        inp.write(str(x))

        for j in range(l-1):
            x = random.randint(-1000, 1000)
            inp.write(" " + str(x))

        inp.write("\n")
