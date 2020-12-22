#import "String";
#import "Basic";


time :: 1006401;
data :: "17,x,x,x,x,x,x,x,x,x,x,37,x,x,x,x,x,449,x,x,x,x,x,x,x,23,x,x,x,x,13,x,x,x,x,x,19,x,x,x,x,x,x,x,x,x,x,x,607,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,29";

/*
the answer is 725,169,163,285,238, after about 6 hours of work.

// this cycle should repeat every 629 clocks, the phase offset for the first number is (37 * 16) - 11 = 544 = (17 * 32)
(37 * 15) mod 17 == 11 

so on every 32nd trip that 17 takes, the condition of 37 leaving 11 cycles later is satisfied


this means the solution is of the form (n * 629) + 544

// this cycle repeats every 16613 clocks, the phase offset for the first number is 7178. 
(449 * 16) mod 37 == 6

on every 194th trip that 37 takes, 449 will leave 6 cycles later

on 17's 32nd trip, 11 minutes later it is 37's 15th trip

so, how often is it both 37's 15/17th trip, and 194/449th trip

so to solve the first three it needs to be
17's 32/37th trip, and 37's 194/449th trip 


17 * 449 = 7633
n = 7633m + 2888
on 37's 2888 trip, it will be both 37's 15/17th trip and 194/449th trip
it will be 449's 867th trip, and 17's 22,898th trip
17's trip will start on cycle 106,862
the cycle of 17, 37, 449 is 282,421


----------------------------------------
(23 * 137) mod 449 == 8

7 = (23 * 137 - 8) / 449
so it needs to be 449's 7/23rd trip and also 449's 238/629th trip

it will be 449's 12,818th trip, with a period of 14,467 trips.
the period is 6,495,683
17 will start on cycle 5,755,265

--------------------------
(13 * 11) mod 23 == 5

6 = (13 * 11 - 5) / 23
it needs to be 23's 250,230 / 282,421st trip, and 23's 6/13th trip

apparently this cycle + 5 is already divisible by 13.
the period is 3671473 trips, which is 84,443,879 cycles


------------------------------------------
(19 * 1) mod 13 == 6

it needs to be 13's 442,715 / 6,495,683 trip and 13's 1/19th trip

it will be 13's 32921130 trip, with a period of 123417977 trips
the period in cycles is 1,604,433,701


-------------------------------------
(607 * 7) mod 19 == 12


it needs to be 19's 22,524,984 / 84,443,879 trip, and also 19's 223/607 trip

it will be 19's 31266760214 trip, with a period of 51257434553 trips
the period in cycles is 973,891,256,507



---------------------------------------
(41 * 474) mod 607 == 10



it needs to be 607's 978,695,954 / 1,604,433,701 trip, and also 607's 32 / 41 trip
it will be 607's 10,605,298,160 trip,  period: 65,781,781,741 trips

--------------------------------------
(29 * 36) mod 41 == 19

    it needs to be 41's 157,010,145,930 / 973,891,256,507 trip, and also 41's 25/29th trip

    it will be 41's 17687052763056 trip. 
    it will also be 29's 25,005,833,216,735 trip

    so now confirm everything

------------------------------------
*/



// to get a phase offset of zero, multiply the two numbers together
// to get a phase offset of one multiply them together and subtract one phase?
/*
    ex:
    5, 13
    5 * 13 = 65
    5 * 7 = 35

    0   5   10  15  20  25  30  35  40  45  50  55  60  65
    0         13          26       39         52        65
    0         -3          -1        -4          -2        0 

    0     7   14      21  28    35
    0     -2   -4     -1   -3    0


    it's like asking (13 * x) % 5 == 1

    (17 * x) % 37 == 11
    (17 * 5 ) = 85
    (85 - 11) / 37 == 2
    (17 * x + 11) = 37 * n

*/

main :: ()
{
    allBusses : [..] int;
    busses : [..] int;
    phaseDelays : [..] int;
    timestampForDelay : [..] int;
    lines := split(data, ",");
    for lines
    {
        if it[0] == #char "x"
            array_add(*allBusses, -1 );
        else
        {
            array_add(*allBusses, string_to_int(it) );
            array_add(*busses, string_to_int(it) );
        }
    }

    phaseDelay := 0;

    for bus : allBusses
    {
        if bus == -1
        {
            phaseDelay += 1;
        }
       else
       {
            phaseDelay += 1;
            array_add(*phaseDelays, phaseDelay);
            phaseDelay = 0;
       }

    }


    for 1 .. phaseDelays.count -1
    {
        delay := phaseDelays[it];
        first := busses[it -1];
        second := busses[it];

        
        for multiple : 1 .. first
        {
            // it's like asking (13 * x) % 5 == 1

            if (second * multiple) % first == delay
            {
                print("(% * %) mod % == %\n", second, multiple, first, delay);
                break;
            }
        }
    }

}