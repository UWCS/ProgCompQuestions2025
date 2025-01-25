import random
from perlin_noise import PerlinNoise

inputFile = "d.in"
nMaps = 40

hmFilter = lambda x: x > 0.1

def generateIslandNumber():
    return random.randint(-9, 9)

with open(inputFile,"w") as inp:
    inp.write(str(nMaps) + "\n")

    for i in range(nMaps):
        # generate noise parameters
        sf = 0.6 + (0.8 * random.random())

        xSize = random.randint(40, 60)
        ySize = random.randint(40, 60)

        divX = sf * xSize
        divY = sf * ySize

        seed = random.random()
        octaves = random.randint(8, 10)

        noise = PerlinNoise(octaves=octaves, seed=seed)

        # write size 
        inp.write(str(xSize) + " " + str(ySize) + "\n")

        # generate maps 
        grid = ["  ".join([str(generateIslandNumber()) if hmFilter(noise([x/divX, y/divY])) else '.' for x in range(xSize)]) for y in range(ySize)]

        for y in range(ySize):
            inp.write(grid[y] + "\n")
