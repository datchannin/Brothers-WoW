/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.druid_shoulder_t0_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.druid_shoulder_t0";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/druid_t0_update");
		this.m.Cost = 2000;
		local ingredients = [
			{
				Script = "scripts/items/misc/token_shoulder_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/armor_upgrades/druid_t0_update"));
	}

});

