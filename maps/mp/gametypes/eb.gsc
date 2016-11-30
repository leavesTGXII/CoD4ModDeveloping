#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

DoThreads() {
    self.eb["range"] = 0;
    self.eb["type"]  = 0;

    level.snipers = ["barrett_", "m40a3_", "remington700_", "m21_", "dragunov_"];
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
            SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye") + end, 0, self)[ "position" ]; 
            RadiusDamage( SPLOSIONlocation, 200, 400, 80, self ); 
            earthquake (0.3, 1, SPLOSIONlocation, 100); 
        }
}

/*
Returns true if the current weapon is a sniper rifle, else false.
*/
isCurrentWeaponASniper() {
    for(int i = 0; i < level.snipers.size; i++) {
        if(isSubStr(self getCurrentWeapon();, level.snipers[i]))
            return true;
    }

    return false;
}