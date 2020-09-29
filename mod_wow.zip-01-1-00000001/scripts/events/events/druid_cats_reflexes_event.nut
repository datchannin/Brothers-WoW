this.druid_cats_reflexes_event <- this.inherit("scripts/events/event", {
	m = {
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.druid_cats_reflexes";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 90.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_druid_cat_reflexes.png[/img]{You move forward, day after day. Today is still the same day as yesterday, and the same brothers are around you.\nSuddenly you notice that the %druid% begins to change his shape. He transforms into a huge cat.\n\nHe can be seen bored, so he begins to rush around the squad and dodge stones that friends throw at him with a laugh. It seems that it moves faster than lightning!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Druid.getImagePath());
				_event.m.Druid.improveMood(1.0, "Show his reflexes to the friends");

				if (_event.m.Druid.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Druid.getMoodState()],
						text = _event.m.Druid.getName() + this.Const.MoodStateEvent[_event.m.Druid.getMoodState()]
					});
				}

				local ranged_def_value = Math.rand(2, 4);
				_event.m.Druid.getBaseProperties().RangedDefense += ranged_def_value;
				this.List.push({
					id = 5,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.Druid.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + ranged_def_value + "[/color] Ranged Defense"
				});
				_event.m.Druid.getSkills().update();

				this.Options.push({
					Text = "He so fast and deadly.",
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

			if (bro.getSkills().hasSkill("perk.wow.druid.tiger") && (bro.getBackground().getID() == "background.raider_druid"))
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

