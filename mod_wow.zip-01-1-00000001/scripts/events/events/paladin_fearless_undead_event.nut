/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.paladin_fearless_undead_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.paladin_fearless_undead";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_fearless_undead.png[/img]{%paladin% tries to cheer up %other%:%SPEECH_ON%I see that you can do more and I will prove it.\nAre you not afraid of the undead? Now you will feel the power of the Light as you fight against all kinds of undead!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Paladin.improveMood(1.5, "Taught an ally how to fight against the undead");
				if (_event.m.Paladin.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				_event.m.Other.getSkills().add(this.new("scripts/skills/traits/hate_undead_trait"));

				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_50.png",
					text = _event.m.Other.getName() + " hates Undead now."
				});

				this.Options.push({
					Text = "It will help us.",
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
		local candidates_paladin = [];
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
			if ((bro.getBackground().getID() == "background.raider_paladin") && (!bro.getSkills().hasSkill("trait.fear_undead")))
			{
				candidates_paladin.push(bro);
			}
			else if ((!bro.getSkills().hasSkill("trait.fear_undead")) && (!bro.getSkills().hasSkill("trait.hate_undead")))
			{
				candidates_other.push(bro);
			}
		}

		if (candidates_paladin.len() == 0)
		{
			return;
		}
		if (candidates_other.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_paladin.len() - 1);
		this.m.Paladin = candidates_paladin[r];
		r = this.Math.rand(0, candidates_other.len() - 1);
		this.m.Other = candidates_other[r];

		this.m.Score = candidates_paladin.len() * 12;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"paladin",
			this.m.Paladin.getName()
		]);
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Paladin = null;
		this.m.Other = null;
	}

});

