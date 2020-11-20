/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.warlock_fear_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null,
		Brother = null
	},
	function create()
	{
		this.m.ID = "event.warlock_fear";
		this.m.Title = "On the road...";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_fear.png[/img]{You move in an even formation. Suddenly %warlock% turns to %brother% and casts a spell.\nA dark aura surrounds %brother%, and he begins to run in a circle.\nIt looks like %warlock% thinks this was a funny joke!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());
				this.Characters.push(_event.m.Brother.getImagePath());

				_event.m.Warlock.improveMood(1.0, "Played a dirty trick.");
				if (_event.m.Warlock.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warlock.getMoodState()],
						text = _event.m.Warlock.getName() + this.Const.MoodStateEvent[_event.m.Warlock.getMoodState()]
					});
				}

				local bravery_value = Math.rand(2, 3);
				_event.m.Brother.getBaseProperties().Bravery -= bravery_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/bravery.png",
					text = _event.m.Brother.getName() + " loses [color=" + this.Const.UI.Color.NegativeEventValue + "]-" + bravery_value + "[/color] Resolve"
				});
				_event.m.Brother.getSkills().update();

				this.Options.push({
					Text = "Stop scaring allies.",
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

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_warlock = [];
		local candidates_brother = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.raider_warlock")
			{
				candidates_warlock.push(bro);
			}
			else
			{
				candidates_brother.push(bro);
			}
		}

		if (candidates_warlock.len() == 0)
		{
			return;
		}
		if (candidates_brother.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_warlock.len() - 1);
		this.m.Warlock = candidates_warlock[r];
		r = this.Math.rand(0, candidates_brother.len() - 1);
		this.m.Brother = candidates_brother[r];

		this.m.Score = 14;
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
		_vars.push([
			"brother",
			this.m.Brother.getName()
		]);
	}

	function onClear()
	{
		this.m.Warlock = null;
		this.m.Brother = null;
	}

});

