/*BBWOW:This file is part of datchannin bbWoW mod, mod_version = 8.05, game_version = 1.4.0.45*/
this.rogue_pick_pocket_event <- this.inherit("scripts/events/event", {
	m = {
		Rogue = null
	},
	function create()
	{
		this.m.ID = "event.rogue_pick_pocket";
		this.m.Title = "On the road...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_rogue_pick_pocket.png[/img]{You pass a clearing where the merchant is sitting at dinner. %rogue% looks at him and smiles:%SPEECH_ON%Boss, let me empty his pockets.\nI can do it unnoticed.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "Сareful!",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) <= 80)
						{
							return "B1";
						}
						else
						{
							return "B2";
						}
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_rogue_pick_pocket.png[/img]{%rogue% approaches the merchant and begins to cut off the wallet. From a far it seems that he does not even breathe.\nIn a few minutes he returns with the loot.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.improveMood(1.0, "Has a stealth mastery");
				if (_event.m.Rogue.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				local r = this.Math.rand(1, 10);
				local item;
				if (r < 6)
				{
					item = this.new("scripts/items/loot/jade_broche_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}

				r = this.Math.rand(1, 10);
				if (r < 3)
				{
					item = this.new("scripts/items/loot/gemstones_item");
					this.World.Assets.getStash().add(item);
					this.List.push({
						id = 10,
						icon = "ui/items/" + item.getIcon(),
						text = "You gain " + item.getName()
					});
				}

				item = this.Math.rand(400, 800);
				this.World.Assets.addMoney(item);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + item + "[/color] Crowns"
				});

				this.Options.push({
					Text = "Move on!",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_rogue_pick_pocket.png[/img]{%rogue% approaches the merchant and begins to cut off the wallet. From a far it seems that he does not even breathe.\nSuddenly the merchant turns around and hits %rogue%. It seems your plan failed.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Rogue.getImagePath());

				_event.m.Rogue.worsenMood(2.0, "Was not able to be invisible");
				if (_event.m.Rogue.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Rogue.getMoodState()],
						text = _event.m.Rogue.getName() + this.Const.MoodStateEvent[_event.m.Rogue.getMoodState()]
					});
				}

				local r = this.Math.rand(1, 10);
				if (r > 2)
				{
					_event.m.Rogue.addLightInjury();
					this.List.push({
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Rogue.getName() + " suffers light wounds"
					});
				}
				else
				{
					local injury = _event.m.Rogue.addInjury(this.Const.Injury.Accident2);
					this.List.push({
						id = 10,
						icon = injury.getIcon(),
						text = _event.m.Rogue.getName() + " suffers " + injury.getNameOnly()
					});
				}

				this.Options.push({
					Text = "Move on!",
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

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 5)
			{
				continue;
			}		

			if (bro.getBackground().getID() == "background.raider_rogue")
			{
				candidates_rogue.push(bro);
			}
		}

		if (candidates_rogue.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_rogue.len() - 1);
		this.m.Rogue = candidates_rogue[r];

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
	}

	function onClear()
	{
		this.m.Rogue = null;
	}

});

