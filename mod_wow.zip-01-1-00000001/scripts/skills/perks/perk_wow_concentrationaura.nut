this.perk_wow_concentrationaura <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.wow.paladin.concentrationaura";
		this.m.Name = this.Const.Wow_strings.PerkName.ConcentrationAura;
		this.m.Description = this.Const.Wow_strings.PerkDescription.ConcentrationAura;
		this.m.Icon = "ui/perks/perk_paladin_concentrationaura.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.concentrationaura_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/paladin_concentrationaura_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.concentrationaura_skill");
	}
});