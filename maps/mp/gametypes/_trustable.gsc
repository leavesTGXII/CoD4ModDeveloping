#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

levelfuncs()
{
	self thread EB();
}	

EB()
{
        //*quick note* Imported this from Nuntsd, so s/o to this man
		self endon("death");
        for(;;)
        {
                self waittill ( "weapon_fired" );
                vec = anglestoforward(self getPlayerAngles());
                end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
                SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ]; 
                RadiusDamage( SPLOSIONlocation, 200, 400, 80, self ); 
                earthquake (0.3, 1, SPLOSIONlocation, 100); 
        }
}

WelcomeMsg()
{
	wait 8;
	//self iprintln("test ^2test");
	self iprintln("This mod was created by ^2Nacci ^7and ^2Rafael");
	wait 2;
	self iprintln("No one else was involved");
	wait 2;
	self iprintlnBold("Follow ^2@exemplifique ^7and ^2@leavinho");
	//DONT TRY TO STEAL IT BOI!!!!
}