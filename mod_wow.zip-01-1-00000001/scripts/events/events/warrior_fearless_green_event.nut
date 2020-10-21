/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.warrior_fearless_green_event <- this.inherit("scripts/events/event", {
	m = {
		Warrior = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.warrior_fearless_green";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_fearless_green.png[/img]{%warrior% talks about the battles against the orcs:%SPEECH_ON%I have fought them all my life since they come from the Dark Portal. Now I am with you. And you, %other%, will begin to engage in battle with greater courage!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Warrior.improveMood(1.5, "Taught an ally how to fight against the orcs and goblins");
				if (_event.m.Warrior.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				_event.m.Other.getSkills().add(this.new("scripts/skills/traits/hate_greenskins_trait"));

				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_52.png",
					text = _event.m.Other.getName() + " hates Greenskins now."
				});

				this.Options.push({
					Text = "This will help us.",
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
		local candidates_other = [];

		if (this.World.getTime().Days < 20)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if ((bro.getBackground().getID() == "background.raider_warrior") && (!bro.getSkills().hasSkill("trait.fear_greenskins")))
			{
				candidates_warrior.push(bro);
			}
			else if ((!bro.getSkills().hasSkill("trait.fear_greenskins")) && (!bro.getSkills().hasSkill("trait.hate_greenskins")))
			{
				candidates_other.push(bro);
			}
		}

		if (candidates_warrior.len() == 0)
		{
			return;
		}
		if (candidates_other.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_warrior.len() - 1);
		this.m.Warrior = candidates_warrior[r];
		r = this.Math.rand(0, candidates_other.len() - 1);
		this.m.Other = candidates_other[r];

		this.m.Score = candidates_warrior.len() * 12;
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
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Warrior = null;
		this.m.Other = null;
	}

});

