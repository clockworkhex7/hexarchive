def remove_one(coins, coin):
    """Remove one coin from a dictionary of coins. Return a new dictionary,
    leaving the original dictionary coins unchanged.

    >>> coins = {2: 5, 3: 2, 6: 1}
    >>> remove_one(coins, 2) == {2: 4, 3: 2, 6: 1}
    True
    >>> remove_one(coins, 6) == {2: 5, 3: 2}
    True
    >>> coins == {2: 5, 3: 2, 6: 1} # Unchanged
    True
    """
    copy = dict(coins)
    count = copy.pop(coin) - 1  # The coin denomination is removed
    if count:
        copy[coin] = count      # The coin denomination is added back
    return copy

print(remove_one({2: 1, 3: 2, 6: 1}, 2))