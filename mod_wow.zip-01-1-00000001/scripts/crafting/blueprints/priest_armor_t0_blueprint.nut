this.priest_armor_t0_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.priest_armor_t0";
		this.m.PreviewCraftable = this.new("scripts/items/armor/priest_t0_armor");
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
		_stash.add(this.new("scripts/items/armor/priest_t0_armor"));
	}

});

