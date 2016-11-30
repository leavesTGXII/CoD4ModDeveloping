#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

doThreads()
{
	self thread SpawnBot();
	self thread TeleportTestclientToCrosshair();
}

SpawnBot()
{
	self endon("death");
	for(;;)
	{
		if (self SecondaryOffhandButtonPressed())
		{
			if (self GetStance() == "prone" && self adsbuttonpressed())
			{
				self thread doBotSpawn();
			}
		}
	}
}

doBotSpawn()
{
	self setClientDvar( "scr_testclients", 1 );
}

TeleportTestclientToCrosshair()
{
	self endon("disconnect");
	for(;;)
	{
		if(self usebuttonpressed());
		{
			spot = self thread GetCursorPos();
			player = undefined;
			for(i=0;i<level.players.size;i++)
			{
			player = level.players[i];
			if (isDefined( player.pers["isBot"] ) && player.pers["isBot"] )
			{
            player setOrigin( spot );
			}
			}
		} 	
	}
}
GetCursorPos()
{
	forward = self getTagOrigin("tag_eye");
	end = self thread vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
	location = BulletTrace( forward, end, 0, self)[ "position" ];
	return location;
}
vector_Scal(vec, scale)
{
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
	return vec;
}