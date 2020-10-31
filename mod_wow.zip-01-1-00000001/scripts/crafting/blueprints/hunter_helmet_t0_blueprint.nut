this.hunter_helmet_t0_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.hunter_helmet_t0";
		this.m.PreviewCraftable = this.new("scripts/items/helmets/hunter_t0_helmet");
		this.m.Cost = 2000;
		local ingredients = [
			{
				Script = "scripts/items/misc/token_helmet_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/helmets/hunter_t0_helmet"));
	}

});

