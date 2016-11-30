#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

/*
utils.gsc should contain a lot of functions that will be reused within our project.
*/

/*
Clears the iPrintln feed.
@time (integer) [optional]: the waiting period before each line clears.
*/
Clear(time) {
    if(!isDefined(time))
        time = 0.05;

    for(i = 0; i < 5; ++i) {
        self iPrintln("");
        wait time;
    }
}

/*
Quickly prints a message.
@message (string): The message to be printed.
*/
QuickMessage(message) {
    self iPrintln(message);

    wait 0.25;
    Clear();
}

/*
Prints a message with "ON" appended to it.
@arg (string): The message.
*/
OnMessage(arg) {
    QuickMessage(arg + " ^2ON");
}

/*
Prints a message with "OFF" appended to it.
@arg (string): The message.
*/
OffMessage(arg) {
    QuickMessage(+ " ^3OFF");
}

/* State handler object */

/*
Creates a new handler object.
@header (string):   The message that will be printed once the state changes.
@states (string[]): The name of all the states.
*/
newHandler(header, states) {
    handler = spawnstruct();

    handler.is_handler = true;
    handler.header = header;
    handler.current_state = 0;
    handler.states = states;

    return handler;
}

/*
Prints the given handler current state.
@handler [handler]: The handler.
*/
printCurrentState(handler) {
    QuickMessage(handler.header + "^6 " + handler.states[handler.current_state]);
}

walkupState(handler) {
    current = handler.current_state;

    if(current + 1 == handler.states.size)
        handler.current_state = 0;
    else 
        handler.current_state++;
}

/*
Toggles the state of a given handler.
@handler (handler):   The handler.
@state_num (integer): The state to be toggled to.
If the state_num is not defined, it will just add 1 to the current state.
*/
toggleState(handler, state_num) {
    if(handler.states >= state_num)
        return;

    if(!isDefined(state_num))
        handler.current_state++;
    else
        walkupState(handler);

    printCurrentState(handler);
}