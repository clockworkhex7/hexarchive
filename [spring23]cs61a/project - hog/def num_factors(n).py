def play(strategy0, strategy1, update,
         score0=0, score1=0, dice=six_sided, goal=GOAL):
    who = 0 
    while score0 < goal and score1 < goal:
        if who == 0:
            num_rolls = strategy0(score0, score1)
            score0 = update(num_rolls, score0, score1, dice)
        elif who == 1:
            num_rolls = strategy1(score1, score0)
            score1 = update(num_rolls, score1, score0, dice)
        who = 1 - who
    return score0, score1

import hog, importlib
importlib.reload(hog)
import tests.play_utils
turns = play(hog, test_number=58200, score0=32, score1=95, goal=99, sus_update)
print(turns)