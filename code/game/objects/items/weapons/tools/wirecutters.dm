/obj/item/tool/wirecutters
	name = "wire cutters"
	desc = "Cuts wires and other objects with it."
	icon_state = "cutters"
	flags = CONDUCT
	force = WEAPON_FORCE_WEAK
	worksound = WORKSOUND_WIRECUTTING
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1)
	attack_verb = list("pinched", "nipped")
	sharp = TRUE
	edge = TRUE
	tool_qualities = list(QUALITY_WIRE_CUTTING = 35, QUALITY_RETRACTING = 15, QUALITY_BONE_SETTING = 15)
	price_tag = 25

/obj/item/tool/wirecutters/bs
	name = "bluespace wire cutters"
	icon_state = "bs_cutters"
	tool_qualities = list(QUALITY_WIRE_CUTTING = 100, QUALITY_RETRACTING = 100, QUALITY_BONE_SETTING = 100)

//Better and more flexible than most improvised tools, but more bulky and annoying to make
/obj/item/tool/wirecutters/improvised
	name = "wire manglers"
	desc = "An improvised monstrosity made of bent rods which can sometimes be used to snip things. Could serve you well if you stuff it with enough tool mods."
	icon_state = "impro_cutter"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	tool_qualities = list(QUALITY_WIRE_CUTTING = 20, QUALITY_RETRACTING = 10, QUALITY_BONE_SETTING = 10, QUALITY_CLAMPING = 10)
	degradation = 1.5
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	price_tag = 12

/obj/item/tool/wirecutters/armature
	name = "armature cutter"
	desc = "Bigger brother of wire cutter. Can't do much in terms of emergency surgery, but does its main job better."
	icon_state = "arm-cutter"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 1)
	tool_qualities = list(QUALITY_WIRE_CUTTING = 45, QUALITY_CUTTING = 30)
	degradation = 0.7
	max_upgrades = 4
	price_tag = 200

/obj/item/tool/wirecutters/pliers //hybrid of wirecutters, wrench and cautery
	name = "pliers"
	desc = "A multitool from the world of maintenance. Useful for pinching, clamping, and occasional bolt turning."
	icon_state = "pliers"
	edge = FALSE
	sharp = FALSE
	tool_qualities = list(QUALITY_WIRE_CUTTING = 15, QUALITY_CLAMPING = 20, QUALITY_BOLT_TURNING = 15, QUALITY_BONE_SETTING = 20)
	price_tag = 20

/obj/item/tool/wirecutters/onestar_pliers //hybrid of wirecutters, wrench and cautery now in plat!
	name = "Greyson Positronic pliers"
	desc = "A multitool from the world of maintenance. Useful for pinching, clamping, and occasional bolt turning. \
			This Greyson Positronic model is simple, yet refined- a significant improvement over every other set of pliers on the market."
	icon_state = "one_star_pliers"
	edge = TRUE //We
	sharp = TRUE//Are
	tool_qualities = list(QUALITY_WIRE_CUTTING = 35, QUALITY_CLAMPING = 35, QUALITY_BOLT_TURNING = 35, QUALITY_BONE_SETTING = 35, QUALITY_RETRACTING = 20)
	degradation = 0.8
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_PLATINUM = 1)
	max_upgrades = 2
	workspeed = 1.5
	price_tag = 300
	allow_greyson_mods = TRUE

/obj/item/tool/wirecutters/attack(mob/living/carbon/C as mob, mob/user as mob)
	if(istype(C) && user.a_intent == I_HELP && (C.handcuffed) && (istype(C.handcuffed, /obj/item/handcuffs/cable)))
		usr.visible_message(
			"\The [usr] cuts \the [C]'s restraints with \the [src]!",
			"You cut \the [C]'s restraints with \the [src]!",
			"You hear cable being cut."
		)
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		return
	else
		..()
