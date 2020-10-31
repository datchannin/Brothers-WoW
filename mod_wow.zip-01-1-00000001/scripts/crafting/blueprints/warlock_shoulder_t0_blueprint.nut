this.warlock_shoulder_t0_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.warlock_shoulder_t0";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/warlock_t0_update");
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
		_stash.add(this.new("scripts/items/armor_upgrades/warlock_t0_update"));
	}

});

