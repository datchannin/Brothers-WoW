/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.paladin_fill_light_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null
	},
	function create()
	{
		this.m.ID = "event.paladin_fill_light";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_fill_light.png[/img]{%paladin% is very active today. It even seems to you that he is looking for a battle.%SPEECH_ON%Boss, I can feel the light fill me. Let\'s get busy with our work, Evil does not sleep!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());

				local initiative_value = Math.rand(5, 8);
				_event.m.Paladin.getBaseProperties().Initiative += initiative_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/initiative.png",
					text = _event.m.Paladin.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative_value + "[/color] Initiative"
				});
				_event.m.Paladin.getSkills().update();

				this.Options.push({
					Text = "We will find how to try your power.",
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

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getBackground().getID() == "background.raider_paladin")
			{
				candidates_paladin.push(bro);
			}
		}

		if (candidates_paladin.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_paladin.len() - 1);
		this.m.Paladin = candidates_paladin[r];

		this.m.Score = candidates_paladin.len() * 7;
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
	}

	function onClear()
	{
		this.m.Paladin = null;
	}

});

