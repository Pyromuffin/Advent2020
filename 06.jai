// using a slope of right 3, down 1, caclulate how many trees you collide with.
// the map wraps on the horizontal axis.

// solution 6 requires us to check several additional slopes.

#import "String";
Basic :: #import "Basic";

CheckSlope :: (lines : [] string, right : int, down : int) -> int
{
    cursor := 0;
    treeCount := 0;
    
    for line : lines
    {
        if(it_index % down != 0)
            continue;

        width := line.count;
        if line.count == 0 then continue;

        if line[cursor] == #char "#"
            treeCount += 1;
        
        cursor = (cursor + right) % width;

    }

    return treeCount;
}


main :: () 
{
    lines := split(data, "\n");

    treeCount0 := CheckSlope(lines, 1, 1);
    treeCount1 := CheckSlope(lines, 3, 1);
    treeCount2 := CheckSlope(lines, 5, 1);
    treeCount3 := CheckSlope(lines, 7, 1);
    treeCount4 := CheckSlope(lines, 1, 2);

    Basic.print("tree count0: %\n", treeCount0);
    Basic.print("tree count1: %\n", treeCount1);
    Basic.print("tree count2: %\n", treeCount2);
    Basic.print("tree count3: %\n", treeCount3);
    Basic.print("tree count4: %\n", treeCount4);
    Basic.print("tree count product: %\n", treeCount0 * treeCount1 * treeCount2 * treeCount3 * treeCount4);
}




data :: #string HERE
...#.....#.......##......#.....
...#..................#........
....##....#.......#............
.........#.......#.......#.....
..#..............#.........#..#
.....#.........#....#....#....#
....##..........#.#.##.........
...#....##...#...#...#.#..#....
...#.......###..........#......
.........#.....#....#...#.#....
.#...###..#..##..#.........###.
#.#...#..........###...#....#..
#....#.#..#..........#.......#.
.#..#........##.#..............
............#..#.#............#
.............#..........#......
...#.......#...............#...
.#...#..#..#............#..#...
....##.##..................#.##
#......#...#..##....#.....#...#
#..#..........##....#...###....
##......#.##.#......#..#......#
....#...#.......##.##...#.#..#.
##.#...#....#...#...#........#.
........#..#.....#....#.......#
.#......#......#..............#
.#.....#..#..#..#..#..#....#..#
.......#.....#.................
.#......#...#..#..#...#...#....
.........#..#..#.........#.....
.....#.........#.#..........#..
#......#....#....##....#.#.#...
................##.#...........
.....##.....#............#.#...
...........#...#.#..##...#.....
.......#....##.......#..#....#.
.##......##....#....####.##..#.
.....#.##.....#...#....##......
.............#....#......#....#
#.#.#.###........#.#....#.#....
.##...........#................
#..#..#...##..##.##...#..#.#...
..#......##..#.#......#..#.#.#.
.....#..............#......#...
#.#..##.##...#............##...
.#......#.............#........
........##....#......#..#......
##.........##....#..........#..
..#..#....#.........##....#..#.
........#..#..#........#...#...
#.........#......##.#...#.##...
.##.............#..###....#.##.
.##.#....#.......#.............
#..##.#.........#..##.#......##
....#..#.......................
.#.#.........#...............#.
....#......#.#..##..#...#.#..#.
#....##...##..#.......##.....##
....##...##...#....#.....#..#..
.#......#.#.#.#......##..#..#..
.....##..#..#.....#.....#...##.
....###................#..#.#..
.....#..#..#.#..........#..#...
...#.....#............#........
#.............#...#..#.....#..#
#........#.....#.#..#......#...
...#.##.....#.#..#.........#..#
.......##...#..#.#....##.......
..................#..##..#.#.#.
..#......#..#..#.....#...#.#...
.#.......#.....#.#....#.#......
##..#.#....#.###..#...#.......#
.......................#.......
..###..........#..##.##.#...##.
.....#...#....###.........#..#.
..#.....#....###...............
....#.......#........#....#..#.
......#................#.#...##
#.....#.......#..#..........##.
#.#....##.........#.....#.#....
#.#.#...#............####.##..#
.....#....####........#...#..#.
....##........#.#..............
.#......#..#..##......#....#.##
..#....#.#........#..#....#....
.#...#.##...#.#.....#.....#...#
..........#................###.
.....#..........##..#..........
.....#..................#...#..
#......##....#.#...#..#.......#
..#......##....#......#.#...#..
###.#..###.#.#..#...#....#.....
#.....#.#...#.##...#........#..
#..........................#...
.#.#.....#.#.#.......##.#.#....
.#....#..##......#....#........
.#.......#.##......#.#..#......
............#.....#....##.##...
....##........##......#........
....#......##....##.....#......
..#.#.....#......#...#.#.......
.###.........#...#........#....
......#.#...##.....##..##..#...
...#...#.#......#..##..#.......
.##....#.#........#.#..........
#....#.#......#......#.#.#.....
#.....#.....#................##
...........#....#...#...#......
..........##..##..#...##.......
.##......#.......#..#.#..##....
..........##....#....#..#.#....
...............#......#.....##.
.#...#....................#..#.
.............###...............
.####..............#...#.......
....#...#.#...#...#....#.......
.......#.#.....................
...............................
#..#.........##.......#.#.#....
....##...#...........#......#..
........##...#......#..........
....#.#.....#..#......#........
#..#................#..#.##....
.#........#.......#.........##.
#...........#...#...#......#.#.
..#.#.#..........##.##...#...#.
..#...#.##...#.#...........#...
##...........##...##...##......
....#....##...#......#..#.....#
#..#.#.#..#...#...#....#.......
............#.....#....#....#.#
....##.....#.........#......#..
.....##.......#...#...#.###....
...##......##..###.#.#....#....
#.#.#.#..#.#.........#...#...##
..#..........#.................
....##....#....................
###.#...............##...##.#..
....#.......##.#..#.#..........
............##..#.......##.....
#...#.........#..#..#..#...#...
..#......##..#.#...##.#.......#
......#................#...#...
......#..###............#.#....
..#.#...###...#..#...#......##.
...#.##...##............#......
#...##........#.#..#.......#...
#..#.....#..#.##...............
..#.....#.#....#.........#.....
.............#....#..#...#.##..
..#.#.....................##.#.
........#.......#..#.#.........
##..............#.....#.......#
.#.##...###....#.....#..##.#...
#..#...#..#......#..........###
#...........#..#...#....#....#.
....#..#.......##......#......#
#...#.#...............##...#...
...##.#..##.......##..#........
...........##..........#.......
..#....#..##...#......#.#......
.#.#....#.#.#...#.#............
.#.#..#...##.......#.#.........
...#...#.............#.######..
##.#........###.......#....#.#.
.#....#.....#.#........#......#
..#.#.........#..........##.#..
.#....#.#..............#......#
.....#..##.........#..##..#....
........#..#....#.......#.....#
#.#.......#.....#.##.#...#....#
...#...##...#....#.....#....#.#
#..##....#..........#..#.......
.......#.#.....#...#.#.#.....##
#...#...#..#......##.#..#......
...#.......#....#...........#.#
##.......#####.#.........#..#..
....#.#...................##...
......#..##............#.......
#.........#....#####.#.#..#.#..
..#......#.#.##............#...
..#...#.....#.#....#......#....
.#...#....#....#.#.#......#.#..
..#.##.....#..........#...#.#..
.......#...#.............#...#.
.#.........#.....#.#........##.
#....#..#..........##.......##.
...#....#.#.........#.......###
......#....#.#......#.......#..
.....#...#...#.#...##..#.#.....
#.........##..#...##..#.#....#.
...#......#.#......##.....#....
.#####.....#.#.#.#...###.##....
..#................#.#...#.#...
#.......##...#.........##..#...
..#.....#....##............#...
#............##...............#
..#..#.................#.......
...............#..#.......##...
..##..#....#...##..........#..#
#...###....##.#.......#.....#..
..........#.........#..#......#
##....#.....#...##.......#.....
..#..#.......#.................
..#..##......#.........#......#
...........##.#..#......#.#..#.
..#...##...##......#...#...#.#.
.#..#.....#.........#..........
#..##...#............#..#.#....
..#...#...##.#........#....#.#.
......##..###.#....#........#..
.....#..#....##...##..........#
................#.#.#.....#..#.
#.##...#......#.#..#.......###.
.......#.#..#..#......#..##..#.
.##...#...#....#....#.......#..
......#..#....#.#.###.....#.#.#
#....#.#...#......#.#.....#..#.
.......#.#...#.#.#............#
#.....#..#...#.................
.....#..........#..#.#..#.#....
.........#......#.#.........###
..#.###........#....##.#.......
.#.......#.#......#........#..#
............#........#.....#...
......#......#....#.#....#.....
.#.......#.....#.##.#..#...#..#
##.....#...#..........##..#...#
.#........#....#...#....##.#...
...#.#.......#.#....#.#...#...#
........#.#.....#.##...#.#.#...
...........#....#..#.........#.
......#.#..#..##...#.......#...
...#....#..#..#.##...........##
.#..#.#.#......#....##...#.....
......#..#........#...##.......
.............#...##.#.....#...#
....#...............##......#.#
.#...........#.........###.##.#
....##........##...#.##.....#..
#......##........#...........#.
###.#.................#.....#..
.....##..#.........#......##.#.
#.#.......##.#..#...#...#......
...#.#..##.....#....##.....#.#.
...##..#...#........#.#..#..#..
...........#....#...#...##.....
##.......#...#.#.##...##..#.#..
#....#.#..##...................
.#...................#.#..#....
#.....#..........#..#...#...#..
...#..#............#.#.........
............#..##.....##......#
#....#.........#.#..#..........
...#.#................#....#.#.
..#..#...#...#.#.#...#.#.#.....
..#.......#.............##..#.#
#........#.#.###.#...#..#.###..
.......#......#..#.....####...#
..##....#..#...................
....##.#....#......#.#..#..#..#
#...........##...#.#.##..###...
##.##......#...........#....#..
.#....#....#..#..#...##...#....
...##.#.#......#...............
.....##.##...#...........#.....
....#...#.#.........##.#....#.#
#..#...........#......#........
..#..#.....#....#.##.......#..#
..#.......##.....##.......#...#
.#.##.#..#...............#....#
.........#...........#.........
..........##......#.#..........
..#........###....#..#...#...#.
....#.#...#.....#..#....#......
..##...##...#..#..##......##..#
..#..#......#....#....#...#..##
...#...............#..#........
....##..#...#......#........#..
###.....##.......#.............
.#.#.##........##..#...#.......
.....###............#..#..#....
.#....##.#...####........#.....
............#.#.....##....#.#..
....#..........#...#...........
........#.#...#..##...........#
#.......#..#.......###...#....#
#....#..#......#.....#...##.#..
..#.............#.#.###...##..#
.#.#....#...#.....#...#.......#
.##.#..#.........#..#......#...
#....#...#......#.....#.....#..
...........#....#.......##...#.
#.#..##....#....#.#.......#.#..
..............#.#..##.##.......
....#........#......#....#.#...
......#.....................#..
#..##...##.....#.........#.....
#.....#.....#....#...#.....#...
........###...........#...#....
............#.....#...##....#..
.......#.......#...#.#...##....
..#.#..#....#...#...#....#.....
..........#.#....#....###....#.
.##...#......###..#............
...#...#........#....#....##...
##.....#.##...#.#...........#.#
..........#.#....#...##.#...#..
..#....#.#...#...#....#.###....
......#.##..#..#.........#.###.
#.#.#.....#.....##.......#.....
...#..#..#....#.#....#....#....
##..#.#................#......#
.....#...#..#......#..####.....
.....##.....#....####......#...
..........##..###.#....#.....##
###...#.......#......##...#....
.......##...#...#..#.##.#....##
.....##.....##...##.....#..#..#
......#.#.....#...#....#...#...
..##........#...#..............
..#........#.##.........#...#..
#....#....#................#...
HERE;