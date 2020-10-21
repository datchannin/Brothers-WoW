/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.priest_injury_heal_event <- this.inherit("scripts/events/event", {
	m = {
		Priest = null,
		Other = null
	},
	function create()
	{
		this.m.ID = "event.priest_injury_heal";
		this.m.Title = "During camp...";
		this.m.Cooldown = 40.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_priest_injury_heal.png[/img]{%priest% has enough strength to heal one of the injuries in the squad.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Priest.getImagePath());

				_event.m.Priest.improveMood(1.0, "Healed the injury");
				if (_event.m.Priest.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Priest.getMoodState()],
						text = _event.m.Priest.getName() + this.Const.MoodStateEvent[_event.m.Priest.getMoodState()]
					});
				}

				_event.m.Priest.addXP(200, false);
				this.List.push({
					id = 5,
					icon = "ui/icons/xp_received.png",
					text = _event.m.Priest.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+200[/color] Experience"
				});
				_event.m.Priest.updateLevel();

				local injuries = _event.m.Other.getSkills().query(this.Const.SkillType.TemporaryInjury);
				local injury = injuries[this.Math.rand(0, injuries.len() - 1)];
				this.List = [
					{
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.Other.getName() + " no longer suffers from " + injury.getNameOnly()
					}
				];
				injury.removeSelf();
				_event.m.Other.updateInjuryVisuals();
				_event.m.Other.getSkills().update();

				this.Options.push({
					Text = "Good work",
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
		local candidates_inj = [];

		if (this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 2)
			{
				continue;
			}

			if (bro.getBackground().getID() == "background.raider_priest")
			{
				candidates_priest.push(bro);
			}

			if (bro.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				candidates_inj.push(bro);
			}
		}

		if (candidates_priest.len() == 0)
		{
			return;
		}
		if (candidates_inj.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_priest.len() - 1);
		this.m.Priest = candidates_priest[r];
		r = this.Math.rand(0, candidates_inj.len() - 1);
		this.m.Other = candidates_inj[r];

		this.m.Score = candidates_priest.len() * 7;
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

