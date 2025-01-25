## (C) Island Search

Sarah is an archaeologist searching for potential dig-sites; she comes across various maps full of islands potentially brimming with history and treasure. 

However there are many of these maps and she doesn't have the time to look through them all! She would really like to know the number of islands on each map to help factor into her decision since a good find on one of the islands on this map indicates many potential good finds in all the numerous other islands.

In addition, she is worried about the safety of these islands. Luckily, DangerousIslandMappingForArchaeologists.com has rated the danger of each acre of each island with a numerical value; Sarah would like to consider the island on each map with the smallest total danger value. This can be calculated as the sum of the danger values of each acre in an island. 

You're provided with several 2D arrays representing the danger levels of each of these maps. Note that:
- a number means that the cell represents physical land (and is hence part of an island)
- a '.' represents the open-water (not part of an island, and which can separate islands)

An island is defined as a group of connected land cells (so have numerical values). A cell is connected to another cell if it is adjacent horizontally or vertically (but not diagonally) i.e. a cell is connected to another cell if it's either:
- to the immediate left of the other cell
- to the immediate right of the other cell
- immediately above the other cell
- immediately below the other cell

Find the number of islands on each map, and also the smallest danger value of an island on the map.

### Input

The first line is the number of maps $n$ ($1 \leq n \leq 50$). 

The next lines contain descriptions of the maps. 

Each description will start with a line containing two integers: the width of the map $w$ ($40 \leq w \leq 60$) and the length of the map $l$ (($40 \leq l \leq 60$)).

The following lines in each description will be a 2D grid of the map, with values in each cell being either:
- a '.' - representing water 
- $x$ where $-9 \leq x \leq 9$ - representing land (part of an island)

### Output

For each description of a map, output two integers on one line: the number of islands, and the smallest danger value of an island from the map.

For instance, if you have 3 maps in your input, your output might look like this:

```
7 -22
3 14
5 16
```

### Sample 1

#### Input (Sample 1)

```
1
16 18
.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .
.  .  -9  0  .  .  .  .  .  .  .  .  .  .  .  .
.  6  -9  -8  .  .  .  .  .  .  .  .  -4  .  .  .
.  -9  -2  .  .  .  .  .  .  .  .  5  -9  .  .  .
.  .  .  .  .  9  -3  -6  0  .  .  .  9  .  .  .
-5  .  .  .  .  .  -7  6  1  .  .  .  .  .  -2  .
.  .  .  .  .  .  5  .  .  .  .  .  .  .  4  1
.  .  .  .  .  .  .  .  .  .  .  -1  .  .  8  -5
.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  -6
.  .  .  .  2  -9  .  .  .  .  .  .  .  .  8  2
4  .  -8  -8  4  .  .  .  2  5  -3  5  .  4  -7  0
.  .  -3  .  .  .  .  .  .  -5  -7  .  .  5  0  -3
.  .  .  .  .  .  .  .  .  -9  1  .  .  .  -1  7
.  .  .  .  .  .  .  .  -6  -3  -6  .  .  .  .  -1
.  1  -8  .  .  .  .  2  4  .  .  -9  .  .  0  -5
.  2  4  .  .  .  .  -7  .  .  .  .  .  .  8  4
.  -3  7  .  .  .  2  .  .  .  .  .  .  -6  1  -9
.  .  .  5  .  .  .  .  -7  0  .  .  .  -1  4  -5
```

**Explanation:** 
#### Output (Sample 1)
```
14 -31
```

**Explanation:** For the number of islands, we can see more clearly with some highlighting over the given map.

<img src="assets/islandHighlighting.png" alt="An annotated image of the input" width="200">

For the minimum value island, we look at Island 1. Clearly the danger value of Island 1 is $(-9) + 0 + 6 + (-9) + (-8) + (-9) + (-2) = -31$.
I will leave finding the danger value of the other islands as an exercise to the reader `:)`

--- 

