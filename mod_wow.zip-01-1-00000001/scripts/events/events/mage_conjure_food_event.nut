/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.mage_conjure_food_event <- this.inherit("scripts/events/event", {
	m = {
		Mage = null
	},
	function create()
	{
		this.m.ID = "event.mage_conjure_food";
		this.m.Title = "During camp...";
		this.m.Cooldown = 28.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_conjure_food.png[/img]{The carriage is running out of food again. You decide to ask what you have long wanted to know:%SPEECH_ON%Tell me, can you really create food out of thin air?%SPEECH_OFF%you ask the %mage%\n\nIn response, he just waves his hand carelessly, and suddenly baskets with fruits and berries appear near you. How could a man of such strength ever end up in a band of vagabonds?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());
				local mage_is_bright = _event.m.Mage.getSkills().hasSkill("trait.bright");

				local item = this.new("scripts/items/supplies/roots_and_berries_item");
				this.World.Assets.getStash().add(item);
				item = this.new("scripts/items/supplies/roots_and_berries_item");
				this.World.Assets.getStash().add(item);

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

				if (mage_is_bright)
				{
					item = this.new("scripts/items/supplies/roots_and_berries_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}
				else
				{
					local effect = this.new("scripts/skills/effects_world/exhausted_effect");
					_event.m.Mage.getSkills().add(effect);
					this.List.push({
						id = 15,
						icon = effect.getIcon(),
						text = _event.m.Mage.getName() + " is exhausted"
					});
				}

				this.Options.push({
					Text = "You have a useful skill!",
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
		local candidates_mage = [];

		if (this.World.Assets.getFood() > 25)
		{
			return;
		}

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_mage")
			{
				candidates_mage.push(bro);
			}
		}

		if (candidates_mage.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_mage.len() - 1);
		this.m.Mage = candidates_mage[r];

		this.m.Score = candidates_mage.len() * 25;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"mage",
			this.m.Mage.getName()
		]);
	}

	function onClear()
	{
		this.m.Mage = null;
	}

});

