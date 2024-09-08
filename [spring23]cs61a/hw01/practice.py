def hailstone(n):
    """Print the hailstone sequence starting at n and return its
    length.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    >>> b = hailstone(1)
    1
    >>> b
    1
    """
    length, curr = 0, n
    while curr >= 1:
        print(curr)
        length += 1
        if curr % 2 == 0:
            curr = curr // 2
        elif curr == 1:
            return length
        else:
            curr = curr * 3 + 1
    
print(hailstone(10))