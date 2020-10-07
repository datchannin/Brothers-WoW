this.warrior_shield_training_event <- this.inherit("scripts/events/event", {
	m = {
		Warrior = null,
	},
	function create()
	{
		this.m.ID = "event.warrior_shield_training";
		this.m.Title = "During camp...";
		this.m.Cooldown = 120.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/world/event_warrior_shield_training.png[/img]{%warrior% picks up a shield and steps aside:%SPEECH_ON%Well, it\'s time to do a workout. I think I\'m much better with the shield than I did last time%SPEECH_OFF%Are you ready to help him?}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				local warrior_shield_expert = _event.m.Warrior.getSkills().hasSkill("perk.shield_expert");
				local warrior_shield_master = _event.m.Warrior.getSkills().hasSkill("perk.wow.warrior.mastershield");

				if (!warrior_shield_expert && !warrior_shield_master)
				{
					this.Options.push({
						Text = "Do you know how use the shield?",
						function getResult( _event )
						{
							return "B1";
						}
					});
				}
				else if (warrior_shield_master)
				{
					this.Options.push({
						Text = "We all help you to train!",
						function getResult( _event )
						{
							return "B2";
						}
					});
				}
				else
				{
					this.Options.push({
						Text = "I help you to train!",
						function getResult( _event )
						{
							return "B3";
						}
					});
				}
			}
		});

		this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/world/event_warrior_shield_training.png[/img]{%warrior% begins to deflect blows with a shield. From the side it seems that he took up the shield for the first time in his life.\nWith such skills, he\'d rather focus on offense than defense.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				_event.m.Warrior.worsenMood(2.0, "Failed to train shield mastery");
				if (_event.m.Warrior.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				this.Options.push({
					Text = "You are newbie with the shield.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B2",
			Text = "[img]gfx/ui/events/world/event_warrior_shield_training.png[/img]{%warrior% begins to deflect blows with a shield. You have never met such skill, at once the whole squad attacks and strikes, but the shield manages to reflect them all!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				_event.m.Warrior.improveMood(2.0, "Master with the shield");
				if (_event.m.Warrior.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				local melee_defense = Math.rand(4, 6);
				local ranged_defense = Math.rand(4, 6);

				_event.m.Warrior.getBaseProperties().MeleeDefense += melee_defense;
				this.List.push({
					id = 5,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Warrior.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee_defense + "[/color] Melee Defense"
				});
				_event.m.Warrior.getBaseProperties().RangedDefense += ranged_defense;
				this.List.push({
					id = 5,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.Warrior.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + ranged_defense + "[/color] Ranged Defense"
				});
				_event.m.Warrior.getSkills().update();

				this.Options.push({
					Text = "You are master with the shield.",
					function getResult( _event )
					{
						return 0;
					}
				});
			}
		});

		this.m.Screens.push({
			ID = "B3",
			Text = "[img]gfx/ui/events/world/event_warrior_shield_training.png[/img]{%warrior% begins to deflect blows with a shield. You strike, and %warrior% deflects hits, and this continues for quite some time. %warrior% seems to be handling the shield with ease, next time you need to attack harder!}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				this.Characters.push(_event.m.Warrior.getImagePath());

				_event.m.Warrior.improveMood(1.0, "Expert with the shield");
				if (_event.m.Warrior.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Warrior.getMoodState()],
						text = _event.m.Warrior.getName() + this.Const.MoodStateEvent[_event.m.Warrior.getMoodState()]
					});
				}

				local melee_defense = Math.rand(2, 4);

				_event.m.Warrior.getBaseProperties().MeleeDefense += melee_defense;
				this.List.push({
					id = 5,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Warrior.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee_defense + "[/color] Melee Defense"
				});
				_event.m.Warrior.getSkills().update();

				this.Options.push({
					Text = "You are expert with the shield.",
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
		local candidates_warrior = [];

		if (this.World.getTime().Days < 60)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{			
			if (bro.getBackground().getID() == "background.raider_warrior")
			{
				candidates_warrior.push(bro);
			}
		}

		if (candidates_warrior.len() == 0)
		{
			return;
		}

		local r;
		r = this.Math.rand(0, candidates_warrior.len() - 1);
		this.m.Warrior = candidates_warrior[r];

		this.m.Score = candidates_warrior.len() * 7;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"warrior",
			this.m.Warrior.getName()
		]);
	}

	function onClear()
	{
		this.m.Warrior = null;
	}

});

