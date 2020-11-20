/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.priest_remove_fear_event <- this.inherit("scripts/events/event", {
	m = {
		Priest = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.priest_remove_fear";
		this.m.Title = "During camp...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_priest_remove_fear.png[/img]{%priest% tells the story of how he met the undead on his way during his life:%SPEECH_ON%Look at me, I\'m weak. I don\'t know how to fight with a weapon. And I has skills only in Healing...\nHowever I am not afraid to face of Death. No one should be afraid of this, and even you, %other%!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Other.improveMood(2.0, "No longer afraid of the undead");

				if (_event.m.Other.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				_event.m.Other.getSkills().removeByID("trait.fear_undead");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_47.png",
					text = _event.m.Other.getName() + " is no longer afraid of the undead"
				});

				this.Options.push({
					Text = "You are weak in body but strong in spirit.",
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

			if ((bro.getBackground().getID() == "background.raider_priest") && (!bro.getSkills().hasSkill("trait.fear_undead")))
			{
				candidates_priest.push(bro);
			}
			else if (bro.getSkills().hasSkill("trait.fear_undead"))
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

