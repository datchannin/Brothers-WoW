/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.rogue_poison_brother_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.rogue_poison_brother";
		this.m.Title = "During camp...";
		this.m.Cooldown = 240.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_poison_brother.png[/img]{After a dinner %other% had severe abdominal pains. Suddenly %rogue% turned pale and ran to rummage in his bag.\nA minute later he returns with a potion in his hands and gives it to %other% to drink:%SPEECH_ON%I was wrong. I think that drops of my poison could get into the %other% food%SPEECH_OFF%However, %other% cannot be completely cured. Traces of this poison will remain in him until the end of his days!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				_event.m.Other.getSkills().add(this.new("scripts/skills/traits/ailing_trait"));

				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_59.png",
					text = _event.m.Other.getName() + " was poisoned."
				});

				_event.m.Rogue.worsenMood(2.0, "Poisoned his friend");
				if (_event.m.Rogue.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}
				_event.m.Other.worsenMood(1.5, "Was poisoned by his friend");
				if (_event.m.Other.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Terrible mistake.",
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
		local candidates_other = [];

		if (this.World.getTime().IsDaytime)
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
			else if (!bro.getSkills().hasSkill("trait.ailing"))
			{
				candidates_other.push(bro);
			}
		}

		if (candidates_rogue.len() == 0)
		{
			return;
		}
		if (candidates_other.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_rogue.len() - 1);
		this.m.Rogue = candidates_rogue[r];
		r = this.Math.rand(0, candidates_other.len() - 1);
		this.m.Other = candidates_other[r];

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
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Rogue = null;
		this.m.Other = null;
	}

});

