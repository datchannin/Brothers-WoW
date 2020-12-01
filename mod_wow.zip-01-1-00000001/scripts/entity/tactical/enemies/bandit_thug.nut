this.bandit_thug <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.BanditThug;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BanditThug.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bandit_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BanditThug);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_bandits");

		if (this.Math.rand(1, 100) <= 10)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_pox_01");
		}
		else if (this.Math.rand(1, 100) <= 15)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_darkeyes_01");
		}
		else
		{
			local dirt = this.getSprite("dirt");
			dirt.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			this.getSprite("eye_rings").Visible = true;
		}

		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hell)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_wow_hell"));
		}

		this.getSprite("armor").Saturation = 0.8;
		this.getSprite("helmet").Saturation = 0.8;
		this.getSprite("helmet_damage").Saturation = 0.8;
		this.getSprite("shield_icon").Saturation = 0.8;
		this.getSprite("shield_icon").setBrightness(0.9);
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 11);

		if (r == 1)
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/goedendag"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pitchfork"));
				}
			}
			else
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/pitchfork"));
				}
			}
		}
		else
		{
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hatchet"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/wooden_stick"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pickaxe"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/reinforced_wooden_flail"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/wooden_flail"));
			}
			else if (r == 10)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
			}
			else if (r == 11)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/dagger"));
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				local r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/shields/buckler_shield"));
				}
			}
		}

		r = this.Math.rand(0, 9);

		if (r <= 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_wraps"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/armor/blotched_gambeson"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/armor/monk_robe"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/armor/gambeson"));
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			local r = this.Math.rand(1, 6);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/hood"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/open_leather_cap"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/mouth_piece"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/full_leather_cap"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/aketon_cap"));
			}
		}
	}

});

