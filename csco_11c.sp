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

public void OnMapStart()
{
	CreateTimer(60.0, Timer_NewUpdate, TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);
}

public Action Timer_NewUpdate(Handle timer)
{
	PrintMessage();
}

void PrintMessage()
{
	CPrintToChatAll(OLDER_TEXT);
	CPrintToChatAll(UPDATE_TEXT, CUR_VERSION, NEW_VERSION);
	CPrintToChatAll(CLIENT_UPDATE);
	CPrintToChatAll(DOWNLOAD_TEXT);
	CPrintToChatAll(DOWNLOAD_URL);
}