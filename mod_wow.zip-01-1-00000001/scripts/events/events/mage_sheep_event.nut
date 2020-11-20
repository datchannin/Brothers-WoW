/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.mage_sheep_event <- this.inherit("scripts/events/event", {
	m = {
		Mage = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.mage_sheep";
		this.m.Title = "Along the road...";
		this.m.Cooldown = 24.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_sheep.png[/img]{%mage% and %other% have been arguing for hours and their argument is getting stronger. It seems that opponents will grab their weapons, but suddenly the %mage% turns %other% into a sheep.\n\nFor several minutes the sheep runs around the squad and bleats, and only then turns back into a tough guy!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());
				this.Characters.push(_event.m.Other.getImagePath());

				local mage_is_bright = _event.m.Mage.getSkills().hasSkill("trait.bright");

				_event.m.Other.worsenMood(1.0, "Was polymorphed by mage");
				if (_event.m.Other.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Other.getMoodState()],
						text = _event.m.Other.getName() + this.Const.MoodStateEvent[_event.m.Other.getMoodState()]
					});
				}

				if (mage_is_bright)
				{
					_event.m.Mage.improveMood(1.0, "Сast a polymorp spell on an ally");

					if (_event.m.Mage.getMoodState() >= this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[_event.m.Mage.getMoodState()],
							text = _event.m.Mage.getName() + this.Const.MoodStateEvent[_event.m.Mage.getMoodState()]
						});
					}
				}

				this.Options.push({
					Text = "Hm...",
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
		local candidates_mage = [];
		local candidates_other = [];

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.raider_mage")
			{
				candidates_mage.push(bro);
			}
			else
			{
				candidates_other.push(bro);
			}
		}

		if (candidates_mage.len() == 0)
		{
			return;
		}
		if (candidates_other.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_mage.len() - 1);
		this.m.Mage = candidates_mage[r];
		r = this.Math.rand(0, candidates_other.len() - 1);
		this.m.Other = candidates_other[r];

		this.m.Score = candidates_mage.len() * 3;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"mage",
			this.m.Mage.getName()
		]);
		_vars.push([
			"other",
			this.m.Other.getName()
		]);
	}

	function onClear()
	{
		this.m.Mage = null;
		this.m.Other = null;
	}

});

