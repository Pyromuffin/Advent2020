// maybe i am dumb but this basically semes like all you need to do is sort this and count the differences between numbers?

#import "String";
#import "Basic";
#import "Sort";

main :: ()
{
    sdata.count -= 1;
    lines := split(sdata, "\n");
    data : [..] int;

    for lines
        array_add(*data,  string_to_int(it));


    sorted := quick_sort(data, x => x);

    ones, twos, threes := 0;

    prev := 0;

    for sorted
    {
        diff := it - prev;
        if diff == 1
            ones += 1;
        else if diff == 2
            twos += 1;
        else if diff == 3
            threes += 1;
        else
            assert(false);

        prev = it;
    }

    threes += 1; // for last difference.

    print("ones: %, twos: %, threes: %, products of ones and twos: %\n", ones, twos, threes, ones * threes);

    
}

sdata := #string HERE
114
51
122
26
121
90
20
113
8
138
57
44
135
76
134
15
21
119
52
118
107
99
73
72
106
41
129
83
19
66
132
56
32
79
27
115
112
58
102
64
50
2
39
3
77
85
103
140
28
133
78
34
13
61
25
35
89
40
7
24
33
96
108
71
11
128
92
111
55
80
91
31
70
101
14
18
12
4
84
125
120
100
65
86
93
67
139
1
47
38
HERE