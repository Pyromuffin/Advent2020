#import "String";
#import "Basic";
#import "Math";

x : int;
y : int;
orientation := 0;

targetX := 10;
targetY := 1;

Forward :: ( dist : int)
{
    x += targetX * dist;
    y += targetY * dist;
}

DumbSin :: (x : int) -> int
{
    if x == 0  
        return 0;
    if x == 90
        return 1;
    if x == 180
        return 0;
    if x == 270
        return -1;

    assert(false);
}

DumbCos :: (x : int) -> int
{
    if x == 0  
        return 1;
    if x == 90
        return 0;
    if x == 180
        return -1;
    if x == 270
        return 0;

    assert(false);
}

main :: ()
{
    data.count -= 1;
    lines := split(data, "\n");

    for line : lines
    {
        parts := split(line, " ");
        op := parts[0][0];
        amount := string_to_int(parts[1]);

        if op == #char "F"
            Forward(amount);
        if op == #char "N"
            targetY += amount;
        if op == #char "S"
            targetY -= amount;
        if op == #char "W"
            targetX -= amount;
        if op == #char "E"
            targetX += amount;
        if op == #char "L"
        {
            // just construct the rotation matrix lmao
            amount = -amount;
            amount += 360;

            s := DumbSin(amount);
            c := DumbCos(amount);
            m00 := c;
            m01 := -s;
            m10 := s;
            m11 := c;

            // no thoughts head empty
            newX := targetX * m00 + targetY * m10;
            newY := targetX * m01 + targetY * m11;
            targetX = newX;
            targetY = newY;

        }
        if op == #char "R"
        {
            s := DumbSin(amount);
            c := DumbCos(amount);
            m00 := c;
            m01 := -s;
            m10 := s;
            m11 := c;

            newX := targetX * m00 + targetY * m10;
            newY := targetX * m01 + targetY * m11;
            targetX = newX;
            targetY = newY;
        }

    }

    print("Coordinates x: %, y: %, manhattan: %", x, y, abs(x) + abs(y) );


}
 
 
data := #string HERE
F 98
S 4
S 4
L 180
W 4
S 2
R 90
E 4
F 60
E 5
R 180
F 100
R 180
F 92
S 1
R 90
F 45
E 4
F 22
R 90
N 3
F 12
W 2
F 95
R 270
F 33
L 90
F 87
L 180
F 17
E 2
R 180
F 75
W 3
F 78
S 1
F 47
L 90
W 2
F 38
W 1
N 4
E 2
R 90
E 4
F 28
L 180
W 2
S 5
L 180
E 4
S 5
W 2
L 90
S 3
E 3
S 1
F 24
W 3
S 2
F 5
E 1
L 90
F 80
S 3
F 83
S 1
E 1
F 49
N 2
R 90
F 28
N 3
L 90
S 5
L 90
F 51
R 90
E 3
R 90
W 1
F 34
W 3
L 90
E 4
L 90
W 4
L 90
F 11
S 3
L 180
F 78
E 3
F 11
R 90
F 72
W 3
F 13
W 1
N 4
W 2
S 2
W 4
N 4
L 90
F 44
E 4
F 2
W 1
S 1
E 1
R 180
F 24
N 3
R 90
F 92
R 90
L 90
F 98
E 5
F 60
R 90
S 2
E 4
F 74
N 4
F 39
N 3
F 13
W 1
N 2
L 90
F 47
S 3
W 4
F 83
N 1
E 3
S 2
F 23
L 270
E 5
F 67
S 1
L 90
W 4
F 86
N 4
R 90
N 3
W 3
S 4
E 5
R 90
S 3
L 180
F 12
N 2
F 66
W 1
F 77
N 3
S 1
W 2
F 84
N 5
F 29
N 4
R 180
F 61
L 270
E 3
S 5
L 180
F 60
N 5
L 90
E 4
F 86
N 5
W 2
L 90
N 2
W 1
S 3
R 90
E 3
S 5
W 3
F 90
W 4
W 5
S 3
F 22
S 3
F 87
R 90
N 2
W 1
N 3
E 4
F 57
R 90
N 3
E 1
L 90
F 69
W 2
N 1
W 3
L 90
E 2
F 21
W 1
F 32
S 5
W 4
F 87
R 90
F 59
L 90
E 5
F 65
L 90
W 2
F 22
R 90
F 24
E 5
W 1
E 2
L 90
F 13
N 4
E 3
F 16
R 90
L 90
S 1
E 5
F 94
R 180
N 5
L 90
F 4
N 4
W 2
S 1
L 180
S 1
L 90
E 3
F 19
L 90
W 2
S 2
F 57
N 5
R 90
E 4
F 95
S 4
R 90
F 10
N 1
F 69
N 4
F 94
W 5
R 90
N 3
F 27
W 5
F 47
S 1
F 6
N 1
L 90
N 5
R 90
E 1
R 90
S 5
W 1
R 90
F 32
E 2
F 58
E 5
F 15
N 5
R 90
F 26
S 3
F 6
S 5
E 5
S 2
L 90
W 5
L 270
F 49
L 90
F 55
L 90
F 62
R 180
S 5
F 36
F 2
S 3
E 1
R 180
E 1
N 5
R 90
W 4
F 21
L 90
S 5
F 11
S 3
N 2
R 90
N 2
R 90
S 3
F 26
R 90
W 3
W 5
F 50
E 3
S 3
L 90
S 2
E 4
R 90
R 90
F 99
L 180
S 4
W 2
R 180
F 47
E 4
N 3
F 43
S 2
F 54
F 71
S 3
E 3
N 5
F 11
F 1
L 180
F 24
E 4
F 84
L 90
F 86
L 90
F 33
W 1
N 3
W 3
S 3
W 3
F 5
N 5
R 90
F 9
R 90
S 4
F 1
S 4
N 2
L 90
S 4
R 90
E 5
S 4
F 87
N 3
E 5
L 180
N 4
L 180
S 3
F 93
L 90
N 5
L 180
L 90
F 41
S 2
L 90
F 88
S 5
F 14
E 1
W 1
N 5
E 1
R 90
W 5
L 90
S 3
F 78
N 1
R 90
F 28
S 3
E 1
F 89
N 1
L 90
E 1
N 5
W 1
L 90
N 3
L 90
S 5
F 55
L 90
N 2
L 180
N 5
L 90
F 19
L 270
W 1
R 90
E 5
S 3
W 1
F 95
E 4
F 51
S 5
F 88
N 4
L 180
W 4
F 97
S 4
F 3
L 180
W 5
L 90
F 62
E 1
N 5
E 3
N 4
R 90
N 1
E 4
S 1
E 4
F 92
W 3
F 22
E 2
F 85
R 90
S 2
R 270
F 16
R 90
W 5
S 4
L 90
S 4
W 3
S 4
F 83
E 3
F 66
N 2
F 63
S 4
F 21
W 5
F 4
N 1
E 3
F 98
S 3
R 90
F 82
F 90
W 2
F 24
E 2
L 90
N 2
L 180
W 2
S 1
F 44
L 90
F 39
R 90
E 3
L 90
F 28
W 5
S 2
L 90
S 4
F 42
E 5
S 4
R 270
F 70
S 1
R 270
S 4
R 90
E 4
F 6
E 2
R 90
W 1
S 3
W 3
F 75
S 1
R 90
S 2
L 90
F 25
R 90
S 1
R 90
N 2
R 180
F 72
W 1
R 90
F 15
E 3
F 86
R 180
E 4
L 180
F 42
N 2
L 90
W 4
F 21
R 90
S 3
E 2
N 5
E 2
F 73
E 5
L 90
F 13
L 90
F 40
E 5
N 5
F 83
E 4
L 90
N 2
F 100
S 1
W 2
N 2
L 90
F 12
S 1
F 15
E 4
F 67
F 47
R 90
F 74
S 4
F 18
L 90
N 3
F 12
N 1
L 180
F 25
E 3
F 27
N 5
L 180
S 5
F 75
R 90
W 3
R 90
W 3
N 4
R 90
E 4
F 15
S 1
W 5
F 19
N 3
F 72
W 5
L 90
F 24
R 90
F 30
R 90
E 4
N 5
W 4
L 90
F 63
E 3
N 3
S 4
F 25
R 90
S 2
F 71
W 2
S 2
N 2
R 90
F 84
R 90
F 37
W 5
L 90
S 3
F 84
L 90
E 3
R 180
F 12
R 90
F 28
W 5
F 13
F 28
E 4
F 41
N 4
W 5
S 4
E 3
F 12
R 180
S 3
W 4
S 5
R 90
L 90
S 2
L 90
F 68
E 2
S 1
E 2
F 32
R 180
F 50
L 270
S 5
R 90
N 3
F 18
W 3
S 1
L 90
W 1
R 90
W 3
R 90
S 2
F 25
W 1
R 90
E 1
R 90
F 71
E 4
L 90
S 4
W 5
F 98
E 4
N 1
F 81
W 1
R 90
F 83
W 1
F 32
L 90
E 5
F 74
E 3
F 37
E 4
S 5
R 90
F 73
L 90
F 60
E 4
F 54
R 90
E 1
R 180
S 1
L 90
F 80
E 3
S 5
L 90
L 180
N 1
F 58
W 2
E 3
S 1
W 2
R 90
N 4
E 4
R 180
F 83
S 5
F 64
R 90
S 1
E 1
L 180
W 3
F 62
R 180
N 3
L 90
E 4
R 90
N 5
F 47
L 180
W 2
R 90
N 4
W 3
F 75
R 90
S 5
E 4
F 11
R 180
W 3
F 40
L 180
W 3
F 91
W 5
F 7
S 4
E 1
R 90
N 1
F 8
HERE