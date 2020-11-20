/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 9.00, game_version = 1.4.0.46*/
this.mage_dalaran_intellect_event <- this.inherit("scripts/events/event", {
	m = {
		Mage = null
	},
	function create()
	{
		this.m.ID = "event.mage_dalaran_intellect";
		this.m.Title = "During camp...";
		this.m.Cooldown = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_mage_dalaran_intellect.png[/img]{%mage% illuminates the entire party with the sign of Dalaran Intellect.\nIt seems that everyone who is nearby can get a little knowledge!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Mage.getImagePath());

				local mage_is_bright = _event.m.Mage.getSkills().hasSkill("trait.bright");
				local brothers = this.World.getPlayerRoster().getAll();

				if (!mage_is_bright)
				{
					foreach( bro in brothers )
					{
						bro.addXP(200, false);
						this.List.push({
							id = 5,
							icon = "ui/icons/xp_received.png",
							text = bro.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+200[/color] Experience"
						});
						bro.updateLevel();
					}
				}
				else
				{
					foreach( bro in brothers )
					{
						bro.addXP(400, false);
						this.List.push({
							id = 5,
							icon = "ui/icons/xp_received.png",
							text = bro.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+400[/color] Experience"
						});
						bro.updateLevel();
					}
				}

				this.Options.push({
					Text = "Please, do it again!",
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

			if (bro.getBackground().getID() == "background.raider_mage")
			{
				candidates_mage.push(bro);
			}
		}

		if (candidates_mage.len() == 0)
		{
			return;
		}

		local r = this.Math.rand(0, candidates_mage.len() - 1);
		this.m.Mage = candidates_mage[r];

		this.m.Score = candidates_mage.len() * 10;
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
	}

	function onClear()
	{
		this.m.Mage = null;
	}

});

