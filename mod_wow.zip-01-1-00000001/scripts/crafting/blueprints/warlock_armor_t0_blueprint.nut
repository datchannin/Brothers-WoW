/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.warlock_armor_t0_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.warlock_armor_t0";
		this.m.PreviewCraftable = this.new("scripts/items/armor/warlock_t0_armor");
		this.m.Cost = 2000;
		local ingredients = [
			{
				Script = "scripts/items/misc/token_chest_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/armor/warlock_t0_armor"));
	}

});

