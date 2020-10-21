/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.druid_vs_bear_event <- this.inherit("scripts/events/event", {
	m = {
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.druid_vs_bear";
		this.m.Title = "During camp...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_vs_bear.png[/img]{A huge bear rushes towards you. And the whole detachment was numb with surprise. However, suddenly %druid% begins to growl and also turns into a bear.\nHe throws himself into battle. You can see that they are the same in strength and size. Soon the battle ends, the wild bear flees, and the druid is breathing heavily, sitting on the ground.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				_event.m.Druid.improveMood(2.0, "Defeated the bear in a duel");

				if (_event.m.Druid.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid.getMoodState()],
						text = _event.m.Druid.getName() + this.Const.MoodStateEvent[_event.m.Druid.getMoodState()]
					});
				}

				local r = this.Math.rand(1, 10);
				if (r > 2)
				{
					_event.m.Druid.addLightInjury();
					this.List.push({
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Druid.getName() + " suffers light wounds"
					});
				}
				else
				{
					local injury = _event.m.Druid.addInjury(this.Const.Injury.Accident2);
					this.List.push({
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.Druid.getName() + " suffers " + injury.getNameOnly()
					});
				}

				local stamina_value = Math.rand(2, 4);
				_event.m.Druid.getBaseProperties().Stamina += stamina_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/fatigue.png",
					text = _event.m.Druid.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina_value + "[/color] Stamina"
				});
				_event.m.Druid.getSkills().update();

				this.Options.push({
					Text = "Good bear.",
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

		if (this.World.getTime().Days < 40)
		{
			return;
		}

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_druid = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 6)
			{
				continue;
			}

			if (bro.getSkills().hasSkill("perk.wow.druid.direbear") && (bro.getBackground().getID() == "background.raider_druid"))
			{
				candidates_druid.push(bro);
			}
		}

		if (candidates_druid.len() == 0)
		{
			return;
		}

		this.m.Druid = candidates_druid[this.Math.rand(0, candidates_druid.len() - 1)];
		this.m.Score = 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"druid",
			this.m.Druid.getName()
		]);
	}

	function onClear()
	{
		this.m.Druid = null;
	}

});

