/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_remove_fainthearted_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.paladin_remove_fainthearted";
		this.m.Title = "During camp...";
		this.m.Cooldown = 200.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_remove_fear.png[/img]{Tonight, after dinner, %paladin% approaches %other% and they begin a long conversation. You are sitting by the fire and listening them: %SPEECH_ON%%other%, I see fear in your heart. But fear has no place in our squad. I will help you!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());
				local effect = this.new("scripts/skills/effects_world/exhausted_effect");

				_event.m.Paladin.improveMood(1.5, "Removed fainthearted from his friend");
				if (_event.m.Paladin.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				_event.m.Paladin.getSkills().add(effect);
				this.List.push({
					id = 15,
					icon = effect.getIcon(),
					text = _event.m.Paladin.getName() + " is exhausted"
				});

				_event.m.Other.getSkills().removeByID("trait.fainthearted");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_41.png",
					text = _event.m.Other.getName() + " is no longer fainthearted"
				});

				this.Options.push({
					Text = "This is useful.",
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

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if ((bro.getBackground().getID() == "background.raider_paladin") && (!bro.getSkills().hasSkill("trait.fainthearted")))
			{
				candidates_paladin.push(bro);
			}
			else if (bro.getSkills().hasSkill("trait.fainthearted"))
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

