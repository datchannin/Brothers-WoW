this.warrior_melee_training_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null,
		Warrior = null,
		Paladin = null,
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.warrior_melee_training";
		this.m.Title = "During camp...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_melee_training.png[/img]{Today %warrior% decided to train some brothers in the skills of hit enemies:%SPEECH_ON%Look at me I can hit even the most agile opponent!%SPEECH_OFF%You spend part of the day training.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				local melee1 = Math.rand(2, 4);
				local melee2 = Math.rand(2, 4);
				local melee3 = Math.rand(2, 4);

				local effect = this.new("scripts/skills/effects_world/exhausted_effect");

				if (_event.m.Rogue != null)
				{
					_event.m.Rogue.getBaseProperties().MeleeSkill += melee1;
					this.List.push({
						id = 5,
						icon = "ui/icons/melee_skill.png",
						text = _event.m.Rogue.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee1 + "[/color] Melee Skill"
					});

					_event.m.Rogue.getSkills().add(effect);
					this.List.push({
						id = 15,
						icon = effect.getIcon(),
						text = _event.m.Rogue.getName() + " is exhausted"
					});

					_event.m.Rogue.getSkills().update();
				}

				if (_event.m.Paladin != null)
				{
					_event.m.Paladin.getBaseProperties().MeleeSkill += melee2;
					this.List.push({
						id = 5,
						icon = "ui/icons/melee_skill.png",
						text = _event.m.Paladin.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee2 + "[/color] Melee Skill"
					});

					_event.m.Paladin.getSkills().add(effect);
					this.List.push({
						id = 15,
						icon = effect.getIcon(),
						text = _event.m.Paladin.getName() + " is exhausted"
					});
					
					_event.m.Paladin.getSkills().update();
				}

				if (_event.m.Druid != null)
				{
					_event.m.Druid.getBaseProperties().MeleeSkill += melee3;
					this.List.push({
						id = 5,
						icon = "ui/icons/melee_skill.png",
						text = _event.m.Druid.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee3 + "[/color] Melee Skill"
					});

					_event.m.Druid.getSkills().add(effect);
					this.List.push({
						id = 15,
						icon = effect.getIcon(),
						text = _event.m.Druid.getName() + " is exhausted"
					});

					_event.m.Druid.getSkills().update();
				}

				this.Options.push({
					Text = "Hard work!",
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
		local candidates_warrior = [];
		local candidates_paladin = [];
		local candidates_druid = [];

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
			if (bro.getBackground().getID() == "background.raider_warrior")
			{
				candidates_warrior.push(bro);
			}
			if (bro.getBackground().getID() == "background.raider_paladin")
			{
				candidates_paladin.push(bro);
			}
			if (bro.getBackground().getID() == "background.raider_druid")
			{
				candidates_druid.push(bro);
			}
		}

		if (candidates_warrior.len() == 0)
		{
			return;
		}

		if ((candidates_rogue.len() == 0) && (candidates_paladin.len() == 0) && (candidates_druid.len() == 0))
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_warrior.len() - 1);
		this.m.Warrior = candidates_warrior[r];

		if (candidates_rogue.len() != 0)
		{
			r = this.Math.rand(0, candidates_rogue.len() - 1);
			this.m.Rogue = candidates_rogue[r];
		}
		if (candidates_paladin.len() != 0)
		{
			r = this.Math.rand(0, candidates_paladin.len() - 1);
			this.m.Paladin = candidates_paladin[r];
		}
		if (candidates_druid.len() != 0)
		{
			r = this.Math.rand(0, candidates_druid.len() - 1);
			this.m.Druid = candidates_druid[r];
		}
		this.m.Score = candidates_warrior.len() * 7;
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
			"warrior",
			this.m.Warrior.getName()
		]);
		_vars.push([
			"paladin",
			this.m.Paladin.getName()
		]);
		_vars.push([
			"druid",
			this.m.Druid.getName()
		]);
	}

	function onClear()
	{
		this.m.Rogue = null;
		this.m.Warrior = null;
		this.m.Paladin = null;
		this.m.Druid = null;
	}

});

