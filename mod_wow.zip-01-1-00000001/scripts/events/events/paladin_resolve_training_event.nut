/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.paladin_resolve_training_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null
	},
	function create()
	{
		this.m.ID = "event.paladin_resolve_training";
		this.m.Title = "On the road...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_mass_resolve.png[/img]{%paladin% offered to train the squad:%SPEECH_ON%Boss, believe, everyone can be braver!\nDuring the battle against enemies, you will appreciate what I am doing now...%SPEECH_OFF%You decided not to interfere with the lesson.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());

				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Paladin.getID())
					{
						continue;
					}

					local resolve = Math.rand(1, 3);
					bro.getBaseProperties().Bravery += resolve;
					this.List.push({
						id = 5,
						icon = "ui/icons/bravery.png",
						text = bro.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + resolve + "[/color] Resolve"
					});
					
					bro.getSkills().update();
				}

				_event.m.Paladin.improveMood(1.5, "Increased Resolve values of his brothers");
				if (_event.m.Paladin.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Excellent day.",
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

		if (this.World.getTime().Days < 30)
		{
			return;
		}

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

