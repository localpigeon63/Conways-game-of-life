# Conways-game-of-life

Conway's Game of Life is a cellular automaton that is played on a 2D square grid. Each square (or "cell") on the grid can be either alive or dead, and they evolve according to the following rules:

Any live cell with fewer than two live neighbours dies (referred to as underpopulation).
Any live cell with more than three live neighbours dies (referred to as overpopulation).
Any live cell with two or three live neighbours lives, unchanged, to the next generation.
Any dead cell with exactly three live neighbours comes to life.




For each cell (array.map - each leaves the original array unchanged, map changes the array)
    Need to make sure it can't take negative numbers or nil
1. Get the statuses of its neighbours
    Store in an array ('neighbours')
    livecount = neighbours.count(1)
2. Check if it is dead or alive (first if statement - but can they work at multiple levels? Check)
3. Apply relevant if statements

For live cells:
    if livecount = 2||3 [double pipe is an or in ruby]
        1
    else
        0

For dead cells:
if livecount = 3
    1