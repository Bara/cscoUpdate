#pragma semicolon 1

#include <sourcemod>
#include <SteamWorks>

#pragma newdecls required

ConVar g_cName = null;

public Plugin myinfo = 
{
	name = "[CSCO] - Description",
	author = "Bara",
	description = "",
	version = "1.0.0",
	url = "github.com/Bara20"
};

public void OnPluginStart()
{
	g_cName = CreateConVar("csco_game_description", "Classic Offensive", "Sets the game description (Default: Counter-Strike: Classic Offensive)");
	g_cName.AddChangeHook(CVAR_ChangeHook);
}

public void CVAR_ChangeHook(ConVar convar, const char[] oldValue, const char[] newValue)
{
	if(convar == g_cName)
	{
		char sBuffer[128];
		strcopy(sBuffer, sizeof(sBuffer), newValue);
		SteamWorks_SetGameDescription(sBuffer);
	}
}

public void OnConfigsExecuted()
{
	char sBuffer[128];
	g_cName.GetString(sBuffer, sizeof(sBuffer));
	SteamWorks_SetGameDescription(sBuffer);
}
