this.perk_wow_frostarmor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.mage.frostarmor";
		this.m.Name = this.Const.Wow_strings.PerkName.FrostArmor;
		this.m.Description = this.Const.Wow_strings.PerkDescription.FrostArmor;
		this.m.Icon = "ui/perks/perk_mage_frostarmor.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.frostarmor_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/mage_frostarmor_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.frostarmor_skill");
	}
});