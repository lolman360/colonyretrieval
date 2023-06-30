
/*
Mica/Slime: CE_BLOODCLOT, +burn, +tox
Mama's Beads, Stone Flower, Jellyfish: bullet armor, +radiation (mamas beads m=no rads)
Flame Battery: burn res
Pellicle: tox res
Electro Battery: siemens resistance
Moonlight, Sparkler: Endurance (Hardiness), -siemens/burn res
Soul, Stone Blood: +hp, -armor
Spring: +melee armor
Crystal, Fireball, Droplets: -radiation, -endurance
Urchin, Crystal Thorn, Thorn: -radiation, +bleeding
Kolobok/Goldfish/Gravi: +melee armor, +radiation (kolo no rads)
*/

/obj/item/stalker_artifact
	name = "Code Artifact"
	desc = "Something not meant to be seen by the eyes of players."
	icon = 'modular_sojourn/annomlies/stalker_annomlies.dmi'
	w_class = ITEM_SIZE_TINY
	icon_state = "wow_this_is_trash"
	item_state = "wow_this_is_trash"

/obj/item/stalker_artifact/dropped(var/mob/M)
	..()
	if(update_artifact(M))
		take_effect(M)

/obj/item/stalker_artifact/equipped(var/mob/M)
	..()
	update_artifact(M)

/obj/item/stalker_artifact/proc/update_artifact(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE
	if(istype(loc, /obj/item/storage/pouch/small_generic/artifact_container))
		var/obj/item/I = loc
		if(I.is_in_pockets())
			return TRUE
	if(is_in_pockets() || is_held())
		return TRUE
	return FALSE

/obj/item/stalker_artifact/antibleed
	name = "Clot Artifact"
	desc = "Base type cot artifact."
	var/antibleed_strength = 0.25



/obj/item/storage/pouch/small_generic/artifact_container
	name = "artifact pouch"
	desc = "Can hold up to three artifacts, and confer their effect on whoever's wearing the pouch in a pocket."
	icon_state = "small_generic_p"
	item_state = "small_generic_p"
	storage_slots = 3
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_BULKY_STORAGE
	matter = list(MATERIAL_BIOMATTER = 5, MATERIAL_PLATINUM = 3, MATERIAL_OSMIUM = 1, MATERIAL_TRITIUM = 1)
	level = BELOW_PLATING_LEVEL //We can hide under tiles :D

