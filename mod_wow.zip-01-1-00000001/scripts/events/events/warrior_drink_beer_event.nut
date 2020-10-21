/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_drink_beer_event <- this.inherit("scripts/events/event", {
	m = {
		Warrior = null
	},
	function create()
	{
		this.m.ID = "event.warrior_drink_beer";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_drink_beer.png[/img]{%warrior% drank a huge amount of beer last night...\n\nThe whole squad is looking forward to when he wakes up after such a powerful binge. %warrior% wakes up, and you notice that he is in a terrible mood, it seems that his hands are even shaking!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				_event.m.Warrior.worsenMood(2.0, "Drunk much beer");
				if (_event.m.Warrior.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				_event.m.Warrior.getSkills().add(this.new("scripts/skills/effects_world/drunk_effect"));

				this.List.push({
					id = 10,
					icon = "skills/status_effect_61.png",
					text = _event.m.Warrior.getName() + " has drunk effect"
				});

				this.Options.push({
					Text = "Don\'t you dare get drunk like that anymore!",
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
			if (bro.getLevel() < 3)
			{
				continue;
			}

			if ((bro.getBackground().getID() == "background.raider_warrior") && (!bro.getSkills().hasSkill("effects.drunk")))
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

