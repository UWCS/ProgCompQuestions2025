## (A) It's Trivial

**Tip for 1st years:** This is the easiest problem that will count towards your PDP `:)`

Two mathematicians, Ray (*R*) and Aastha (*A*), are playing a game to determine who is better at maths.

The mathematicians take turns playing the game and they alternate. For example, R might play turns `1, 3, 5, ...` and A would play turns `1, 4, 6, ...`. 

For each turn, they are presented with a maths problem. If the mathematician can solve the problem easily, then they say "it is trivial" and they gain a point. If they cannot, then they say "it is not trivial" and their score remains the same.

A mathematician wins when they are the first to achieve **k** number of "it is trivial" responses; this **k** value can also be called the "target" of the game. You will be given **n** games and output for each game who has won the game. 

### Input

First line will contain an integer **n** (**1 <= n <= 800**) to represent the number of games.

The following lines contain descriptions of **n** completed games.

For each game, the first line will contain **k** (**1 <= k <= 200**) (the target of the game i.e. the number of "it is trivial" responses to win). 
The second line will contain **m** (**1 <= k < m <= 1000**) which is the number of turns in the following lines.
In the following **m** lines, each line will describe a "turn" in the game. The turn will either start with `R: ` or `A: `, signifying that it's either Ray's response or Aastha's response respectively. 

### Output

For each game in the input, output a line in the form `X wins` where `X` is either `R` or `A`. 

### Sample 1

#### Input (Sample 1)

```#2-12
1
4
9
R: it is trivial
A: it is not trivial 
R: it is trivial
A: it is trivial 
R: it is not trivial
A: it is not trivial
R: it is trivial
A: it is trivial
R: it is trivial
```

**Explanation:** The first line contains 1 meaning 1 game (and therefore we'll output 1 line). 

The second line is 4 and indicates that the target for the game is 4 i.e. the first person to hit 4 'trivial's will win. 

The third line indicates that there will be 9 lines of input. 

In the following lines, R says "it is trivial" 4 times and says "it is not trivial" 1 time.
A says "it is trivial" 2 times and says "it is not trivial" 2 times. 

#### Output (Sample 1)

```
R wins
```

Since R says "it is trivial" 4 times (the target amount for the game), R wins.  


### Sample 2

#### Input (Sample 2)

```#2-6
2
2
3
R: it is trivial
A: it is not trivial 
R: it is trivial
1
2
R: it is not trivial
A: it is trivial
```

**Explanation:** The first line contains 2 meaning 2 games (and therefore we'll output 2 lines). 

For the first game, we have **k=2** (target is 2 trivial responses) and 3 turns. In the following 3 lines (each line representing a turn), R says "it is trivial" 2 times and says "it is not trivial" 1 time. A says "it is trivial" 0 times and says "it is not trivial" 1 time. 

For the second game, we have **k=1** (target is 1 trivial response) and 2 turns. In the following 2 lines, R says "it is trivial" 0 times and says "it is not trivial" 1 time. A says "it is trivial" 1 time and says "it is not trivial" 0 times. 


#### Output (Sample 2)

```
R wins
A wins
```

For the first game, R wins because R says "it is trivial" 2 times.
For the second game, A wins because A says "it is trivial" 1 time.

--- 
