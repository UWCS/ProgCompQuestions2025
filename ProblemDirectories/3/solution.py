import sys
import math
from itertools import combinations
from collections import deque

def parse_input():
    input_data = sys.stdin.read().strip().split("\n")
    n = int(input_data[0])  # Number of meadows
    meadows = []
    i = 1
    for _ in range(n):
        m = int(input_data[i])  # Number of trees in this meadow
        i += 1
        trees = []
        for _ in range(m):
            x, y = map(int, input_data[i].split())
            trees.append((x, y))
            i += 1
        meadows.append(trees)
    return meadows

def distance(p1, p2):
    """Euclidean distance between two points."""
    return math.sqrt((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2)

def convex_hull(points):
    """Computes the convex hull of a set of 2D points using Graham's scan algorithm."""
    points = sorted(points)
    
    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

    # Lower hull
    lower = []
    for p in points:
        while len(lower) >= 2 and cross(lower[-2], lower[-1], p) <= 0:
            lower.pop()
        lower.append(p)

    # Upper hull
    upper = []
    for p in reversed(points):
        while len(upper) >= 2 and cross(upper[-2], upper[-1], p) <= 0:
            upper.pop()
        upper.append(p)

    # Remove last point of each half because it's repeated at the start of the other half
    return lower[:-1] + upper[:-1]

def inside_convex_hull(point, hull):
    """Checks if a point is inside or on the convex hull using ray-casting."""
    crossings = 0
    n = len(hull)
    for i in range(n):
        p1 = hull[i]
        p2 = hull[(i + 1) % n]
        if p1[1] > point[1] != p2[1] > point[1]:
            slope = (point[0] - p1[0]) * (p2[1] - p1[1]) - (point[1] - p1[1]) * (p2[0] - p1[0])
            if slope == 0 or slope > 0:
                crossings += 1
    return crossings % 2 == 1

def largest_empty_circle(trees):
    """Finds the radius of the largest circle that fits inside the convex hull and avoids all trees."""
    hull = convex_hull(trees)
    max_radius = 0

    # Test all points of intersection between lines from the hull and tree pairs
    candidates = hull + [(a[0] + b[0]) / 2, (a[1] + b[1]) 
