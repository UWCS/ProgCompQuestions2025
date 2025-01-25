## (B) 2-Sublist Sum 

Alex has several lists of integers and in each list, he’d like you to find whether a sublist (essentially a sublist which allows duplicate values i.e. a multiset) of the numbers from the list sums up to a number ("target) specific to each list. However, he only cares about “small” sublists i.e. sublist that have 2 or fewer elements. 

For lists that have such a sublist, output the indices of the elements in the sublist in ascending order. For lists that don’t, output “None”.

Note: 
- The lists are 1-indexed i.e. the first element in the list has an index of 1.
- The empty set has an undefined sum here hence no list will have the empty set as a solution. 

### Input

First line will contain an integer $n$, and $1 \leq n \leq 1000$. $n$ represents the number of lists. 

The next $n \times 3$ lines describe the $n$ lists (and their target values).

For each list, the first line is an integer $x$ which is the target value. 
The second line contains $k$ which is the length of the list. 
The third line contains the list itself, and so contains $k$ integers. 

### Output

For each list, output either:
- `None` if there is no solution
- `[x]` if there is a sublist of size 1 where the only element has index $x$ 
- `[x,y]` if there is a sublist of size 2 where the elements have indexes $x, y$ where $x < y$

### Sample 1

#### Input (Sample 1)

```
3
12
7
1 5 3 4 50 3 7
41
9
5 63 47 82 93 1 14 32 56
803
9
835 793 212 6263 116 324 803 826 543
```

**Explanation:** The first line indicates there are 3 lists to consider.

The next $3 \times 3$ lines describe the 3 lists (and their target values).

For the first list, the first line indicates the target is 12 i.e. we are looking for a sublist of size 1 or 2 which sums to 12. The second line indicates the number of elements in the list is 7. The third line contains the 7 numbers that are in the list. 

For the second list, we have the target as 41. Length as 9. 

For the third list, we have the target as 803. Length as 9.

#### Output (Sample 1)

```
[2,7]
None
[7]
```

**Explanation:** For the first list, we have that the element at index 2 (5) and the element at index 7 (7) sum to the target (12). 

For the second list, we have no sublists (with length of 1 or 2) that sum to the target (41). So the output is `None`.

For the third list, we have a sublist of size 1 that sums to the target (803). That is, the element at index 7 (803) is equal to the target.
