#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

// <<<<<<< HEAD:maps/mp/gametypes/_trustable.gsc
levelfuncs()
{
	self thread EB();
}	
=======
/* 
This is script is being developed by Leaves (aka Rafael) and naccib.
Feel free to clone/used it somewhere else, but make sure to credit us.

Open source COD modding, here we go!
*/	

/*
Toggles EB with a type.
@eb_type (integer): The range of the EB, this should be 150, 400, 600, 1000 or 99999.

Note: this EB function came from Nuntsd, s/o to him!
*/
EB(eb_type)
{
        self endon("death");
        for(;;)
        {
                self waittill ( "weapon_fired" );
                vec = anglestoforward(self getPlayerAngles());
                end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
                SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ]; 
                RadiusDamage( SPLOSIONlocation, 200, 400, 80, self ); 
                earthquake (0.3, 1, SPLOSIONlocation, eb_type); 
        }
}

WelcomeMsg()
{
	wait 8;
	//self iprintln("test ^2test");
	self iprintln("This mod was created by ^2Nacci ^7and ^2Rafael.");
	wait 2;
	self iprintln("No one else was involved.");
	wait 2;
	self iprintlnBold("Follow ^2@exemplifique ^7and ^2@leavinho.");
	//DONT TRY TO STEAL IT BOI!!!!
}