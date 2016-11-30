#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

/* 
This is script is being developed by Leaves (aka Rafael) and naccib.
Feel free to clone/used it somewhere else, but make sure to credit us.

Open source COD modding, here we go!
*/	

BalasExplosivas()
{
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