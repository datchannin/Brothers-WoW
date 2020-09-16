/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.02, game_version = 1.4.0.42*/
this.include("scripts/tools/weak_table_ref");
local gt = this.getroottable();
gt.Const <- {};
local scriptsPath = "scripts/";
local scriptsConfigPath = "scripts/config/";
local scriptsDLCInitPath = "scripts/dlc/";
local priorityScriptFiles = [
	scriptsConfigPath + "global",
	scriptsConfigPath + "ui",
	scriptsConfigPath + "strings",
	scriptsConfigPath + "wow_strings",
	scriptsConfigPath + "character_names",
	scriptsConfigPath + "spawnlist_master"
];

foreach( scriptFile in priorityScriptFiles )
{
	this.include(scriptFile);
}

local configScriptFiles = this.IO.enumerateFiles(scriptsConfigPath);

foreach( configScriptFile in configScriptFiles )
{
	if (priorityScriptFiles.find(configScriptFile) == null)
	{
		this.include(configScriptFile);
	}
}

local dlcInitScriptFiles = this.IO.enumerateFiles(scriptsDLCInitPath);

if (dlcInitScriptFiles != null)
{
	foreach( dlc in dlcInitScriptFiles )
	{
		this.include(dlc);
	}
}

local scriptFiles = this.IO.enumerateFiles(scriptsPath);

foreach( scriptFile in scriptFiles )
{
	this.include(scriptFile);
}

