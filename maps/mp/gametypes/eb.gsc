#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

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
                SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye") + end, 0, self)[ "position" ]; 
                RadiusDamage( SPLOSIONlocation, 200, 400, 80, self ); 
                earthquake (0.3, 1, SPLOSIONlocation, 100); 
        }
}