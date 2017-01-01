#pragma semicolon 1

#include <sdktools>

#define OLDER_TEXT "This server use a older version of csco!"
#define UPDATE_TEXT "Current Version is %s and newest version is: %s"
#define CLIENT_UPDATE "Please update your client soon as possible..."
#define NEW_VERSION "1.1c"
#define CUR_VERSION "1.1b"
#define DOWNLOAD_TEXT "Download for newest version:"
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
	CreateTimer(60.0, Timer_NewUpdate, TIMER_FLAG_NO_MAPCHANGE | TIMER_REPEAT);
}

public Action Timer_NewUpdate(Handle timer)
{
	PrintToChatAll(OLDER_TEXT);
	PrintToChatAll(UPDATE_TEXT, CUR_VERSION, NEW_VERSION);
	PrintToChatAll(CLIENT_UPDATE);
	PrintToChatAll(DOWNLOAD_TEXT);
	PrintToChatAll(DOWNLOAD_URL);
}
