/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.rogue_stamina_training_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null,
		Warrior = null,
		Paladin = null,
		Druid = null
	},
	function create()
	{
		this.m.ID = "event.rogue_stamina_training";
		this.m.Title = "During camp...";
		this.m.Cooldown = 80.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_stamina_training.png[/img]{Today %rogue% decided to train some brothers in the skills of long fighting:%SPEECH_ON%Look at me I can fight for hours when other fighters collapse from fatigue!%SPEECH_OFF%You spend part of the day training.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				local stamina1 = Math.rand(4, 6);
				local stamina2 = Math.rand(4, 6);
				local stamina3 = Math.rand(4, 6);

				local effect = this.new("scripts/skills/effects_world/exhausted_effect");

				if (_event.m.Warrior != null)
				{
					_event.m.Warrior.getBaseProperties().Stamina += stamina1;
					this.List.push({
						id = 5,
						icon = "ui/icons/fatigue.png",
						text = _event.m.Warrior.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina1 + "[/color] max fatigue"
					});

					_event.m.Warrior.getSkills().add(effect);
					this.List.push({
						id = 15,
						icon = effect.getIcon(),
						text = _event.m.Warrior.getName() + " is exhausted"
					});

					_event.m.Warrior.getSkills().update();
				}

				if (_event.m.Paladin != null)
				{
					_event.m.Paladin.getBaseProperties().Stamina += stamina2;
					this.List.push({
						id = 5,
						icon = "ui/icons/fatigue.png",
						text = _event.m.Paladin.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina2 + "[/color] max fatigue"
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
					_event.m.Druid.getBaseProperties().Stamina += stamina3;
					this.List.push({
						id = 5,
						icon = "ui/icons/fatigue.png",
						text = _event.m.Druid.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + stamina3 + "[/color] max fatigue"
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

		if (candidates_rogue.len() == 0)
		{
			return;
		}

		if ((candidates_warrior.len() == 0) && (candidates_paladin.len() == 0) && (candidates_druid.len() == 0))
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_rogue.len() - 1);
		this.m.Rogue = candidates_rogue[r];

		if (candidates_warrior.len() != 0)
		{
			r = this.Math.rand(0, candidates_warrior.len() - 1);
			this.m.Warrior = candidates_warrior[r];
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

