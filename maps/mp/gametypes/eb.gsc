#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

EBThreads() 
{
	self thread EB();
}

/*
Toggles EB with a type.
@eb_range (integer): The range of the EB, this should be 150, 400, 600, 1000 or 99999.
@eb_type  (integer): The type of the EB: 0 should be snipers only and 1 should be every weapon.

Note: this EB function came from Nuntsd, s/o to him!
*/

EB(eb_range, eb_type)
{
        self endon("death");

        for(;;)
        {
            self waittill ( "weapon_fired" );

            if(eb_type == 0 && !isCurrentWeaponASniper())
                return;

            vec = anglestoforward(self getPlayerAngles());
            end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
            trace = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye") + end, 0, self)[ "position" ]; 
            RadiusDamage( trace, 200, 400, 80, self ); 
            earthquake (0.3, 1, trace, 100); 
        }
}