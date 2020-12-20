#import "String";
#import "Basic";
#import "Sort";

main :: ()
{
    sdata.count -= 1;
    lines := split(sdata, "\n");
    data : [..] int;

    array_add(*data, 0);

    for lines
        array_add(*data,  string_to_int(it));

   quick_sort(data, x => x);

    last := data[data.count - 1];
    array_add(*data, last + 3);

    ways_to_connect : [..] int;
    array_resize(*ways_to_connect, last + 4);

    ways_to_connect[0] = 1;

    for data 
    {

        // look at three previous indices.
        prev := it_index - 1;
        prev2 := it_index - 2;
        prev3 := it_index - 3;

        if (prev >= 0) && ( (it - data[prev] ) <= 3 )
            ways_to_connect[it] += ways_to_connect[data[prev]];

        
        if (prev2 >= 0) && ( (it - data[prev2]) <= 3 )
            ways_to_connect[it] += ways_to_connect[data[prev2]];

            
        if (prev3 >= 0) && ( (it - data[prev3]) <= 3 )
            ways_to_connect[it] += ways_to_connect[data[prev3]];

    }


    print ("there are % ways to connect. \n", ways_to_connect[last + 3] );

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