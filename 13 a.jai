#import "String";
#import "Basic";


time :: 1006401;
data :: "17,x,x,x,x,x,x,x,x,x,x,37,x,x,x,x,x,449,x,x,x,x,x,x,x,23,x,x,x,x,13,x,x,x,x,x,19,x,x,x,x,x,x,x,x,x,x,x,607,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,29";

main :: ()
{
    busses : [..] int;
    differences : [..] int;
    lines := split(data, ",");
    for lines
    {
        if it[0] == #char "x"
            continue;
        
        array_add(*busses, string_to_int(it) );
    }
 
    for bus : busses
    {
        leavingTime := 0;
        while leavingTime < time
        {
            leavingTime += bus;
        }

        array_add(*differences, leavingTime - time);
    }

    min := 0xFFFFFFFF; // a big number
    minId := 0;
    for differences
    {
        if it < min 
        {
            min = it;
            minId = busses[it_index];
        }
    }

    print("Bus ID: %, difference: %, product: %", minId, min, minId * min);

}