this.druid_take_mushrooms_event <- this.inherit("scripts/events/event", {
	m = {
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.druid_take_mushrooms";
		this.m.Title = "On the road...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_take_mushrooms.png[/img]{There are almost no food left, but you do not want to tell the rest of your companions about it. A little more, and they will undestand what it is like to starve for long-long days.\n%druid% approaches you almost unnoticed.%SPEECH_ON%Hi, I know there is a problem with food. And I tried to fix it.%SPEECH_OFF%He opens a sack that is filled with huge mushrooms. You are happy to take the loot, but one thought does not leave you. Where, the hell, the druid could get so many mushrooms on the way?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());

				local r = this.Math.rand(1,4);
				local item = this.new("scripts/items/supplies/pickled_mushrooms_item");
				this.World.Assets.getStash().add(item);
				item = this.new("scripts/items/supplies/pickled_mushrooms_item");
				this.World.Assets.getStash().add(item);
				
				if (r == 1)
				{
					item = this.new("scripts/items/supplies/pickled_mushrooms_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}

				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});

				this.Options.push({
					Text = "Thanks for work!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_druid = [];

		if (this.World.Assets.getFood() > 25)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_druid")
			{
				candidates_druid.push(bro);
			}
		}

		if (candidates_druid.len() == 0)
		{
			return;
		}

		this.m.Druid = candidates_druid[this.Math.rand(0, candidates_druid.len() - 1)];
		this.m.Score = candidates_druid.len() * 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"druid",
			this.m.Druid.getName()
		]);
	}

	function onClear()
	{
		this.m.Druid = null;
	}

});

