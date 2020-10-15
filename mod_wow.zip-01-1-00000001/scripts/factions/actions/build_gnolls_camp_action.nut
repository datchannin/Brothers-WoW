this.build_gnolls_camp_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "build_gnolls_camp_action";
		this.m.IsRunOnNewCampaign = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (this.World.getTime().Days < this.Const.Expantion.gnoll_days)
		{
			return;
		}
	
		local settlements = _faction.getSettlements();
		if (settlements.len() > (this.Const.Expantion.gnoll_count - 1))
		{
			return;
		}

		this.m.Score = 2;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local camp;

		this.logInfo("!!!SPAWN GNOLLS LOCATION!!!");

		local tile = this.getTileToSpawnLocation(this.Const.Factions.BuildCampTries, [
			this.Const.World.TerrainType.Mountains
		], 7, 20, 1000, 7, 7, null, 0.75);

		if (tile != null)
		{
			camp = this.World.spawnLocation("scripts/entity/world/locations/gnoll_camp_location", tile.Coords);
			this.logInfo("!!!SPAWN GNOLLS LOCATION CAMP!!!");
		}

		if (camp != null)
		{
			local banner = this.getAppropriateBanner(camp, _faction.getSettlements(), 15, this.Const.GnollBanners);
			camp.onSpawned();
			camp.setBanner(banner);
			_faction.addSettlement(camp, false);
		}
	}

});

