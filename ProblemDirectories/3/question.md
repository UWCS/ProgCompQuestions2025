# III. Largest Flower Beds  

## Problem Statement  
In a region with multiple meadows, Jordi want to plant circular flower beds. Each meadow contains trees scattered across a flat plane, and you must help Jordi determine the largest possible circular flower bed that can be planted without overlapping any of the trees. That is:

1. The circle's centre must be placed **within the convex hull** of the trees in the meadow.  
2. The circle’s radius is determined by its distance to the closest tree.  
3. Each meadow contains at least three trees, and no two trees are at the same position.  

Your task is to calculate the radius of the largest flower bed that can be placed in each meadow.

---

## Input  
- The first line contains an integer $n$ ($1 \leq n \leq 10$), the number of meadows.  
- For each meadow:  
  - The first line contains an integer $m$ ($3 \leq m \leq 100$), the number of trees in the meadow.  
  - The next $m$ lines each contain two integers, $x_i$ and $y_i$ ($-10^4 \leq x_i, y_i \leq 10^4$), representing the coordinates of the trees in the meadow.  
  - No two trees will have the same coordinates.  

---

## Output  
For each meadow, output a single floating-point number representing the radius of the largest circle that can be placed, rounded to six decimal places. Print the results in the order the meadows are given in the input.

---

## Examples  

**Input 1:**
```
1
4
0 0
4 0
4 4
0 4
```

**Output 1:**  
```
2.000000
```


**Explanation:**  
The largest circle can be placed within the square formed by the trees. Its center is at $(2,2)$, and its radius is $2$.

---

**Input 2:**

```
2
3
0 0
4 0
2 3
5
0 0
10 0
10 10
0 10
5 5
```

**Output 2:***
```
1.333333
5.000000
```

**Explanation:**  
- For the first meadow, the optimal circle is centered at $(2,1)$ with a radius of $1.333333$.  
- For the second meadow, the optimal circle is centered at $(5,5)$ with a radius of $5.000000$.
