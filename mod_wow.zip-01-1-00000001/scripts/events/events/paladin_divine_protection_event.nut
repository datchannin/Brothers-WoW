/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.paladin_divine_protection_event <- this.inherit("scripts/events/event", {
	m = {
		Paladin = null
	},
	function create()
	{
		this.m.ID = "event.paladin_divine_protection";
		this.m.Title = "During the battle...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_paladin_divine_protection.png[/img]{You are fighting against a squad of robbers. %paladin% stands behind the squad and supports your allies with auras.\nDuring the battle, you see one of the robbers swinging a huge hammer at your soldier. %paladin% maintains his presence of mind and uses a bright shield of light to keep his friend from perishing. A minute later he is again in excellent spirits, and it seems his fighting spirit has grown.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Paladin.getImagePath());

				_event.m.Paladin.improveMood(2.0, "Saved an ally from certain death");
				if (_event.m.Paladin.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Paladin.getMoodState()],
						text = _event.m.Paladin.getName() + this.Const.MoodStateEvent[_event.m.Paladin.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Сrush everyone!",
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

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getLevel() < 7)
			{
				continue;
			}

			if ((bro.getBackground().getID() == "background.raider_paladin") && (bro.getSkills().hasSkill("perk.wow.paladin.divineshield")))
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

