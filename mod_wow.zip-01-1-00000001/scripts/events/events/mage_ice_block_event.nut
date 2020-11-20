/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.mage_ice_block_event <- this.inherit("scripts/events/event", {
	m = {
		Mage = null
	},
	function create()
	{
		this.m.ID = "event.mage_ice_block";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_ice_block.png[/img]{A loud wolf howl keeps you awake tonight. You heard the screeching and barking, as well as the scream of a person, and went in the direction of these sounds.\nMoving away from the camp a little, you saw that the %mage% was frozen in a block of ice, and several wolves were trying to gnaw their way to him. A couple more minutes and it would be too late, but together you can defeat these wolves!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());
				local mage_is_bright = _event.m.Mage.getSkills().hasSkill("trait.bright");

				_event.m.Mage.improveMood(1.0, "Defeated wild beasts");
				if (_event.m.Mage.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Mage.getMoodState()],
						text = _event.m.Mage.getName() + this.Const.MoodStateEvent[_event.m.Mage.getMoodState()]
					});
				}

				if (mage_is_bright)
				{
					local item = this.new("scripts/items/misc/werewolf_pelt_item");
					this.World.Assets.getStash().add(item);
					item = this.new("scripts/items/misc/werewolf_pelt_item");
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
				}

				this.Options.push({
					Text = "You are lucky to stay alive",
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

		this.m.Score = candidates_mage.len() * 10;
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

