#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\eb;

/*
Main gsc where we link all threads
*/

levelfuncs()
{
	self thread EBThreads();
}

WelcomeMsg()
{
	wait 8;
	self iprintln("test of a ^2test");
	wait 2;
	self iprintlnbold("Follow ^2@exemplifique ^7& ^2@leavinho");
}
