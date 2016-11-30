#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;


/*
Toggles EB with a type.
@eb_range (integer): The range of the EB, this should be 150, 400, 600, 1000 or 99999.
@eb_type  (integer): The type of the EB: 0 should be snipers only and 1 should be every weapon.

Note: this EB function came from Nuntsd, s/o to him!
*/


EBThreads() 
{
	self thread ClassicEB();
}

ClassicEB()
{
	self endon("disconnect");
	self endon("killed_player");
	self endon("joined_spectators");

	for(;;)
	{
		if(self meleeButtonPressed())     /* quick note here: u cant turn off, but it'll be fixed */
		{
			catch_next = false;
			count = 0;

			for(i=0; i<0.5; i+=0.05)
			{
				if(catch_next && self meleeButtonPressed() && self isOnground())
				{
	                                wait 0.05;
									self thread ToggleClassicEB();
                                    self iPrintln( "Classic EB ^2ON" );
					wait 1;
					break;
				}
				else if(!(self meleeButtonPressed()) && !(self attackButtonPressed()))
					catch_next = true;

				wait 0.05;
			}
		}
		wait 0.05;
	}
}
ToggleClassicEB()
{
        self endon("death");
		self endon("stop_eb");
        for(;;)
        {
                self waittill ( "weapon_fired" );
                vec = anglestoforward(self getPlayerAngles());
                end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
                trace = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ]; 
                RadiusDamage( trace, 400, 400, 80, self ); 
                earthquake (0.3, 1, trace, 100); 
        }
}

UnfairAimbotThread()
{
	self endon( "disconnect" );
	self endon( "stop_aimbot");
	for(;;)
	{
		self waittill( "weapon_fired" );
		wait 0.01;
		aimAt = undefined;
		for ( i = 0;i < level.players.size;i++ )
		{
			if( (level.players[i] == self) || (level.teamBased && self.pers["team"] == level.players[i].pers["team"]) || ( !isAlive(level.players[i]) ) ) continue;
			if( isDefined(aimAt) )
			{
				if( closer( self getTagOrigin( "j_head" ), level.players[i] getTagOrigin( "j_head" ), aimAt getTagOrigin( "j_head" ) ) ) aimAt = level.players[i];
			}
			else aimAt = level.players[i];
		}
		if( isDefined( aimAt ) )
		{
			aimAt thread [[level.callbackPlayerDamage]]( self, self, 2147483600, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0 );

		
			}
	}
}