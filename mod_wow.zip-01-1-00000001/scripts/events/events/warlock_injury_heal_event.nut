this.warlock_injury_heal_event <- this.inherit("scripts/events/event", {
	m = {
		Warlock = null
	},
	function create()
	{
		this.m.ID = "event.warlock_injury_heal";
		this.m.Title = "During camp...";
		this.m.Cooldown = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warlock_injury_heal.png[/img]{%warlock% has enough strength to heal his injury on his own.\nEven if this is require to use the vitality of some animals!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warlock.getImagePath());

				local injuries = _event.m.Warlock.getSkills().query(this.Const.SkillType.TemporaryInjury);
				local injury = injuries[this.Math.rand(0, injuries.len() - 1)];
				this.List = [
					{
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.Warlock.getName() + " no longer suffers from " + injury.getNameOnly()
					}
				];
				injury.removeSelf();
				_event.m.Warlock.updateInjuryVisuals();
				_event.m.Warlock.getSkills().update();

				this.Options.push({
					Text = "Good news!",
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
		local candidates_warlock = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 2)
			{
				continue;
			}
		
			if (bro.getBackground().getID() == "background.raider_warlock" && bro.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				candidates_warlock.push(bro);
			}
		}

		if (candidates_warlock.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_warlock.len() - 1);
		this.m.Warlock = candidates_warlock[r];
		
		this.m.Score = candidates_warlock.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warlock",
			this.m.Warlock.getName()
		]);
	}

	function onClear()
	{
		this.m.Warlock = null;
	}

});

