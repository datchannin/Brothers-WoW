/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_rain_event <- this.inherit("scripts/events/event", {
	m = {
		Warrior = null
	},
	function create()
	{
		this.m.ID = "event.warrior_rain";
		this.m.Title = "During camp...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_rain.png[/img]{It has been raining all day and everyone is glad that it is finally evening. You sit around the fire, and %warrior% begins to clean his weapons and armor from adhering dirt:%SPEECH_ON%I hate this weather, I hate this mud and rain. Boss, I need a personal squire!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				_event.m.Warrior.worsenMood(1.5, "Hate rain");
				if (_event.m.Warrior.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				this.Options.push({
					Text = "This is not my business.",
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
		local candidates_warrior = [];

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getLevel() < 6)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_warrior")
			{
				candidates_warrior.push(bro);
			}
		}

		if (candidates_warrior.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_warrior.len() - 1);
		this.m.Warrior = candidates_warrior[r];

		this.m.Score = candidates_warrior.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warrior",
			this.m.Warrior.getName()
		]);
	}

	function onClear()
	{
		this.m.Warrior = null;
	}

});

