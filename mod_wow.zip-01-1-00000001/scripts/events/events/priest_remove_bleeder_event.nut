/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.priest_remove_bleeder_event <- this.inherit("scripts/events/event", {
	m = {
		Priest = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.priest_remove_bleeder";
		this.m.Title = "During camp...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_priest_remove_bleeder.png[/img]{%other% is near the campfire, and %priest% is asking the Light to help him to recover issues.%SPEECH_ON%For the first time in a long time I actually feel quite alright. Thanks, %priest%!%SPEECH_OFF%The Light can make wonders.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Other.improveMood(1.5, "Feels the best he did in a long time");

				if (_event.m.Other.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				_event.m.Other.getSkills().removeByID("trait.bleeder");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_16.png",
					text = _event.m.Other.getName() + " is no longer bleeder"
				});

				this.Options.push({
					Text = "Thanks for your help, %priest%.",
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
		local candidates_priest = [];
		local candidates_bleeder = [];

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_priest")
			{
				candidates_priest.push(bro);
			}
			else if (bro.getSkills().hasSkill("trait.bleeder"))
			{
				candidates_bleeder.push(bro);
			}
		}

		if (candidates_priest.len() == 0)
		{
			return;
		}
		if (candidates_bleeder.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_priest.len() - 1);
		this.m.Priest = candidates_priest[r];
		r = this.Math.rand(0, candidates_bleeder.len() - 1);
		this.m.Other = candidates_bleeder[r];

		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"priest",
			this.m.Priest.getName()
		]);
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Priest = null;
		this.m.Other = null;
	}

});

