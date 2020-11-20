/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_get_fire_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null
	},
	function create()
	{
		this.m.ID = "event.rogue_get_fire";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_get_fire.png[/img]{You set up camp and try to start a fire. Because of the rain, this cannot be done immediately, but your fighters are already hungry...%SPEECH_ON%Boss, let me try!%SPEECH_OFF%%rogue% pours out some kind of powder and a second later the fire burns brightly.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.improveMood(1.0, "Was able get fire");
				if (_event.m.Rogue.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Good work.",
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
		local candidates_rogue = [];

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

			if (bro.getBackground().getID() == "background.raider_rogue")
			{
				candidates_rogue.push(bro);
			}
		}

		if (candidates_rogue.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_rogue.len() - 1);
		this.m.Rogue = candidates_rogue[r];

		this.m.Score = candidates_rogue.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"rogue",
			this.m.Rogue.getName()
		]);
	}

	function onClear()
	{
		this.m.Rogue = null;
	}

});

