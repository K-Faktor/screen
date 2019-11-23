init()
{
    level thread onPlayerConnect();
}
 
onPlayerConnect()
{
    for(;;)
    {
        level waittill("connecting", player);

        player thread onPlayerSpawn();
    }
}

onPlayerSpawn()
{ 
    self endon("disconnect");

    for(;;)
    {
        self waittill("spawned_player");

        if(!isDefined(self.pers["tookScreen"]))
        {
            self.pers["tookScreen"] = true;
			wait 10;
            exec("getss " + self getPlayerID());
        }  
    }
	
	self thread checkforquit(self getPlayerID(), self.name, self GetEntityNumber());	
}

checkforquit(PlayerID, name, entnumber) 
{
	self thread stopwait();
	
	self notify("stopwait");
	self endon("stopwait");
	self waittill ( "disconnect" );
	exec("permban " + PlayerID + " ^3Античит: ^1Обнаружен Мультихак"); 
}

stopwait() 
{
	self endon("disconnect");
	wait 1.5;
	self notify("stopwait");
}