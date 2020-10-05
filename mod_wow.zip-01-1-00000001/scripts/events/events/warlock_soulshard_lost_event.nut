this.warlock_soulshard_lost_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null
	},
	function create()
	{
		this.m.ID = "event.warlock_soulshard_lost";
		this.m.Title = "During camp...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_soulshard_lost.png[/img]{It looks like %warlock% has lost one of his soulshards, and now he will have to get a new one during a battle!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				_event.m.Warlock.worsenMood(1.0, "Has lost the soulshard");
				if (_event.m.Warlock.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Muddler...",
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
		local candidates_warlock = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 4)
			{
				continue;
			}
		
			if (bro.getBackground().getID() == "background.raider_warlock")
			{
				candidates_warlock.push(bro);
			}
		}

		if (candidates_warlock.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_warlock.len() - 1);
		this.m.Warlock = candidates_warlock[r];
		
		this.m.Score = candidates_warlock.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warlock",
			this.m.Warlock.getName()
		]);
	}

	function onClear()
	{
		this.m.Warlock = null;
	}

});

