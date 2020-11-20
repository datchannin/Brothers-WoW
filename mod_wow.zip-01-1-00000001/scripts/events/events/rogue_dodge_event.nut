/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.rogue_dodge_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null
	},
	function create()
	{
		this.m.ID = "event.rogue_dodge";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_dodge.png[/img]{Your squad passes by a huge old tree. When suddenly a thick branch falls on %rogue% who is near the tree right now. Rogue\'s inhuman reflexes can only be envied: he managed to jump to the side a second before the impact.\nEveryone was impressed:%SPEECH_ON%Look, it\'s incredible!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					bro.improveMood(1.0, "Rogue has inhuman reflexes!");

					if (bro.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}

				this.Options.push({
					Text = "Incredible!",
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

		if (!this.World.getTime().IsDaytime)
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

