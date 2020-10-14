this.gnoll_brute <- this.inherit("scripts/entity/tactical/actor", {
	m = {
		color = 2
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.GnollBrute;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.GnollBrute.XP;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.DecapitateSplatterOffset = this.createVec(25, -25);
		this.m.ConfidentMoraleBrush = "icon_confident";
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/gnoll_death_01.wav",
			"sounds/enemies/gnoll_death_02.wav",
			"sounds/enemies/gnoll_death_03.wav",
			"sounds/enemies/gnoll_death_04.wav",
			"sounds/enemies/gnoll_death_05.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/gnoll_flee_01.wav",
			"sounds/enemies/gnoll_flee_02.wav",
			"sounds/enemies/gnoll_flee_03.wav",
			"sounds/enemies/gnoll_flee_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/gnoll_hurt_01.wav",
			"sounds/enemies/gnoll_hurt_02.wav",
			"sounds/enemies/gnoll_hurt_03.wav",
			"sounds/enemies/gnoll_hurt_04.wav",
			"sounds/enemies/gnoll_hurt_05.wav",
			"sounds/enemies/gnoll_hurt_06.wav",
			"sounds/enemies/gnoll_hurt_07.wav",
			"sounds/enemies/gnoll_hurt_08.wav",
			"sounds/enemies/gnoll_hurt_09.wav",
			"sounds/enemies/gnoll_hurt_10.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/gnoll_idle_01.wav",
			"sounds/enemies/gnoll_idle_02.wav",
			"sounds/enemies/gnoll_idle_03.wav",
			"sounds/enemies/gnoll_idle_04.wav",
			"sounds/enemies/gnoll_idle_05.wav",
			"sounds/enemies/gnoll_idle_06.wav",
			"sounds/enemies/gnoll_fatigue_01.wav",
			"sounds/enemies/gnoll_fatigue_02.wav",
			"sounds/enemies/gnoll_fatigue_03.wav"
		];
		this.m.SoundPitch = 1.0;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Death] = 0.9;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] = 0.9;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Idle] = 1.25;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/orc_young_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		local flip = this.Math.rand(1, 100) < 50;

		if (_tile != null)
		{
			this.m.IsCorpseFlipped = flip;
			local decal;
			local appearance = this.getItems().getAppearance();
			local sprite_body = this.getSprite("body");
			local sprite_head = this.getSprite("head");
			decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = sprite_body.Color;
			decal.Saturation = sprite_body.Saturation;
			decal.Scale = 0.9;
			decal.setBrightness(0.9);

			if (appearance.CorpseArmor != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmor, this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (_fatalityType != this.Const.FatalityType.Decapitated)
			{
				if (!appearance.HideCorpseHead)
				{
					decal = _tile.spawnDetail(sprite_head.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Color = sprite_head.Color;
					decal.Saturation = sprite_head.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (appearance.HelmetCorpse != "")
				{
					decal = _tile.spawnDetail(appearance.HelmetCorpse, this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}
			}
			else if (_fatalityType == this.Const.FatalityType.Decapitated)
			{
				local layers = [];

				if (!appearance.HideCorpseHead)
				{
					layers.push(sprite_head.getBrush().Name + "_dead");
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					layers.push(appearance.HelmetCorpse);
				}

				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(-50, 30), 180.0, "bust_orc_01_head_dead_bloodpool");
				local idx = 0;

				if (!appearance.HideCorpseHead)
				{
					decap[idx].Color = sprite_head.Color;
					decap[idx].Saturation = sprite_head.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}
			}

			if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_orc_01_body_dead_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail(("bust_naked_gnoll_body_0" + this.m.color + "_dead_arrows"), this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail(("bust_naked_gnoll_body_0" + this.m.color + "_dead_javelin"), this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}

			this.spawnTerrainDropdownEffect(_tile);
			local corpse = clone this.Const.Corpse;
			corpse.CorpseName = "A Rookie Gnoll";
			corpse.Tile = _tile;
			corpse.IsResurrectable = false;
			corpse.IsConsumable = true;
			corpse.Items = this.getItems();
			corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}

		this.getItems().dropAll(_tile, _killer, flip);
		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onInit()
	{
		this.m.color = this.Math.rand(2, 3);
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.GnollRookie);

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 150)
		{
			b.RangedSkill += 5;
		}

		b.IsSpecializedInAxes = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Items.getAppearance().Body = ("bust_naked_gnoll_body_0" + this.m.color);
		this.addSprite("socket").setBrush("bust_base_gnolls");
		local body = this.addSprite("body");
		body.setBrush("bust_naked_gnoll_body_0" + this.m.color);
		body.varySaturation(0.05);
		body.varyColor(0.07, 0.07, 0.07);
		local injury_body = this.addSprite("injury_body");
		injury_body.Visible = false;
		injury_body.setBrush("bust_naked_gnoll_body_0" + this.m.color + "_injured");
		this.addSprite("armor");
		local head = this.addSprite("head");
		head.setBrush("bust_head_gnoll_0" + this.m.color);
		head.Saturation = body.Saturation;
		head.Color = body.Color;
		local injury = this.addSprite("injury");
		injury.Visible = false;
		injury.setBrush("bust_head_gnoll_0" + this.m.color);
		this.addSprite("helmet");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.55;
		this.m.Skills.add(this.new("scripts/skills/special/double_grip"));
		this.m.Skills.add(this.new("scripts/skills/actives/hand_to_hand"));
		this.m.Skills.add(this.new("scripts/skills/actives/charge"));

		if (this.Const.DLC.Unhold)
		{
			this.m.Skills.add(this.new("scripts/skills/actives/wake_ally_skill"));
		}
	}

	function onFinish()
	{
		this.actor.onFinish();
	}

	function assignRandomEquipment()
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body) == null)
		{
			this.m.Items.equip(this.new("scripts/items/armor/gnolls/gnoll_brute_armor"));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head) == null)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/gnolls/gnoll_brute_helmet"));
		}
	}

});

