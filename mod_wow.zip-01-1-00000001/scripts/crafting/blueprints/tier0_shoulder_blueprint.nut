this.tier0_shoulder_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.tier0_shoulder";
		this.m.PreviewCraftable = this.new("scripts/items/misc/token_shoulder_item");
		this.m.Cost = 10000;
		local ingredients = [
			{
				Script = "scripts/items/misc/inventory_badge_item",
				Num = 6
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
		_stash.add(this.new("scripts/items/misc/token_shoulder_item"));
	}

});

