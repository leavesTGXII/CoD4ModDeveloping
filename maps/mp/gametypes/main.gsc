#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\eb;
#include maps\mp\gametypes\bots;

/*	Clean main.gsc
we gon use that to
add the "doThreads"
look-a-like */

/*
Start notification events for button pressing.
*/
startButtonNotify() {
    for(;;) {
        if( self UseButtonPressed()) self notify( "X" );
        if( self AttackButtonPressed()) self notify( "RT" );
        if( self AdsButtonPressed()) self notify( "LT" );
        if( self secondaryOffhandButtonPressed()) self notify( "LB" );
        if( self FragButtonPressed()) self notify( "RB" );
        if( self MeleeButtonPressed()) self nofify( "RS" );

        self wait(0.25);
    }
}

levelfuncs()
{

}
