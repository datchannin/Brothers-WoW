/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.tier0_helmet_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.tier0_helmet";
		this.m.PreviewCraftable = this.new("scripts/items/misc/token_helmet_item");
		this.m.Cost = 9000;
		local ingredients = [
			{
				Script = "scripts/items/misc/inventory_badge_item",
				Num = 8
			}
		];
		this.init(ingredients);
	}

	function isQualified()
	{
		return true;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/token_helmet_item"));
	}

});

