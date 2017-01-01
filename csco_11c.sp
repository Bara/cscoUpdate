#pragma semicolon 1

#include <sourcemod>
#include <multicolors>

#define OLDER_TEXT "{darkred}This server use a older version of csco!"
#define UPDATE_TEXT "{darkred}Current Version is %s {default}and {lightgreen}newest version is: %s"
#define CLIENT_UPDATE "{lightred}Please update your client soon as possible..."
#define NEW_VERSION "1.1c"
#define CUR_VERSION "1.1b"
#define DOWNLOAD_TEXT "{green}Download for newest version:"
#define DOWNLOAD_URL "http://steamcommunity.com/groups/classicoffensive#announcements/detail/289753044212556658"

public Plugin myinfo = 
{
	name = "[CSCO] - New Update",
	author = "Bara",
	description = "",
	version = "1.0",
	url = "github.com/Bara20"
};

public void OnPluginStart()
{
	HookEvent("player_spawn", PlayerEvent);
	HookEvent("player_death", PlayerEvent);
	
	HookEvent("round_start", RoundEvent);
	HookEvent("round_end", RoundEvent);
}

public Action PlayerEvent(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	
	if(client > 0 && IsClientInGame(client) && !IsFakeClient(client))
	{
		PrintMessage(client);
	}
}

public Action RoundEvent(Event event, const char[] name, bool dontBroadcast)
{
	for (int i = 1; i <= MaxClients; i++)
	{
		if(IsClientInGame(i) && !IsFakeClient(i))
		{
			PrintMessage(i);
		}
	}
}

void PrintMessage(int client)
{
	CPrintToChat(client, OLDER_TEXT);
	CPrintToChat(client, UPDATE_TEXT, CUR_VERSION, NEW_VERSION);
	CPrintToChat(client, CLIENT_UPDATE);
	CPrintToChat(client, DOWNLOAD_TEXT);
	CPrintToChat(client, DOWNLOAD_URL);
	
	LogMessage("Print message to \"%L\"", client);
}
