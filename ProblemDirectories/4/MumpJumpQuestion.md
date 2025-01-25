## (D) Mump Jump

Mump needs your help! Mump would like the highest score possible for each track in a game. Each track is made up of cells, and each cell has a score (which can be negative). 

Before beginning a track, Mump starts with a score of 0. 

Mump can start *anywhere* on the track, but must start somewhere on the track; that is, it's not possible for Mump to not start on a track. At least one cell must be visited. 

Once Mump has started on a track, Mump must finish the track from that start! Mump can move forward either 2 or 3 cells. Why? Due to Mump's spirited energy, Mump cannot move only 1 cell forward and poor Mump cannot possibly move more than 3 cells at a time!

Your task is to determine the maximum score that Mump can achieve on given tracks. 

### Input

First line will contain the number of tracks $n$ ($1 \leq n \leq 4000$).

The following $n \times 2$ lines will describe the $n$ tracks. Each track will take up 2 lines.

The first line for each track $x$ contains the length ($l$) of $x$; $l$ is the number of cells that $x$ is made up of. We have $450 \leq l \leq 3000$.
The second line for $x$ contains the scores of the cells of $x$. 
For each score ($x_{i}$), we have $-1000 \leq x_{i} \leq 1000$.

### Output

For each track, output a line containing the maximum score for that track. 

### Sample 1

#### Input (Sample 1)

```
3
7
14 3 2 7 8 4 1
8
41 5 -31 -52 0 11 -3 9
9
-17 -6 1 -11 -13 -7 22 3 17
```

**Explanation:** The first line tells us there are 3 tracks; the next $3 \times 2$ lines describe the 3 tracks.

For the first track, we have $l=7$ and so the next line contains 7 values. 
For the second track, we have $l=6$ and so the next line contains 6 values.
For the third track, we have $l=8$ and so the next line contains 8 values.

#### Output (Sample 1)

```
25
30
39
```

**Explanation:** Maximum values corresponding to the 3 tracks.

For the first track, we have the optimal value of 25. We can achieve this maximum by starting at index 0 ($x_{0}=14$) -> index 3 ($x_{3}=7$) -> index 5 ($x_{5}=4$) -> end of track. So our score is $14 + 7 + 4 = 25$.

For the second track, we have the optimal value of 30. We can achieve this maximum by starting at index 0 ($x_{0}=41$) -> index 2 ($x_{2}=-31$) -> index 5 ($x_{5}=11$) -> index 7 ($x_{7}=9$) -> end of track. So our score is $41 + -31 + 11 + 9 = 30$.

For the third track, we have the optimal value of 39. Interestingly, we don't start at the beginning to achieve this maximum. We achieve this by starting at index 6 ($x_{6}=22$) -> index 8 ($x_{8}=17$) -> end of track. So our score is $22 + 17 = 39$.

--- 
