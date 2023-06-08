/mob/living/carbon/superior_animal/human/stranger
	name = "Stranger"
	desc = "A stranger from an unknown place."
	icon = 'icons/mob/mobs-humanoid.dmi'
	icon_state = "strangerranged"
	icon_dead = "stranger_dead"
	icon_gib = "syndicate_gib"
	speak_chance = 0
	turns_per_move = 4
	ranged_cooldown = 1
	stop_automated_movement_when_pulled = FALSE
	maxHealth = 200
	health = 200
	melee_damage_lower = 15
	melee_damage_upper = 15
	ranged_cooldown = 2
	rapid_fire_shooting_amount = 3
	attacktext = "punched"
	a_intent = I_HURT
	status_flags = CANPUSH
	ranged = TRUE
	rapid = TRUE
	armor = list(melee = 25, bullet = 15, energy = 25, bomb = 25, bio = 100, rad = 100) //Were in a space suit thing?
	projectiletype = /obj/item/projectile/plasma/heavy
	projectilesound = 'sound/weapons/guns/unknown_spacegun_vaporize.ogg'
	faction = "bluespace"
	leather_amount = 0
	bones_amount = 0
	var/empy_cell = FALSE
	var/prob_tele = 20
	never_stimulate_air = TRUE

/mob/living/carbon/superior_animal/human/Initialize(mapload)
	. = ..()
	do_sparks(3, 0, src.loc)

/mob/living/carbon/superior_animal/human/stranger/death()
	. = ..()
	var/obj/item/gun/energy/plasma/stranger/S = new (src.loc)
	S.cell = new S.suitable_cell(S)
	if(empy_cell)
		S.cell.use(S.cell.charge)
	else
		S.cell.use(S.cell.maxcharge/2)
	S.update_icon()
	new /obj/effect/decal/cleanable/ash (src.loc)
	var/atom/movable/overlay/animation
	animation = new(loc)
	animation.icon_state = "blank"
	animation.icon =  'icons/mob/mob.dmi'
	animation.master = src
	flick("dust2-h", animation)
	do_sparks(3, 0, src.loc)
	qdel(src)
	qdel(animation)

/mob/living/carbon/superior_animal/human/stranger/attack_generic(mob/user, damage, attack_message)
	var/mob/living/targetted_mob = (target_mob?.resolve())

	if(!damage || !istype(user))
		return FALSE
	if(prob(prob_tele))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/carbon/superior_animal/human/stranger/attackby(obj/item/W, mob/user, params)
	var/mob/living/targetted_mob = (target_mob?.resolve())

	if(prob(prob_tele))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/carbon/superior_animal/human/stranger/attack_hand(mob/living/carbon/M)
	var/mob/living/targetted_mob = (target_mob?.resolve())

	if(M.a_intent != I_HELP && prob(prob_tele))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)
		return FALSE
	. = ..()

/mob/living/carbon/superior_animal/human/stranger/bullet_act(obj/item/projectile/P, def_zone)
	var/mob/living/targetted_mob = (target_mob?.resolve())

	if (!(P.testing))
		if(prob(prob_tele))
			var/source = src
			if(targetted_mob)
				source = targetted_mob
			var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
			do_sparks(3, 0, src.loc)
			do_teleport(src, T)
			return FALSE
	. = ..()

/mob/living/carbon/superior_animal/human/stranger/Life()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	. = ..()
	if(. && prob(prob_tele/2))
		var/source = src
		if(targetted_mob)
			source = targetted_mob
		var/turf/T = get_random_secure_turf_in_range(source, 4, 2)
		do_sparks(3, 0, src.loc)
		do_teleport(src, T)

/obj/item/gun/energy/plasma/stranger
	name = "unknown plasma gun"
	desc = "A plasma gun from unknown origin"
	icon = 'icons/obj/guns/energy/lancer.dmi'
	icon_state = "lancer"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 7, MATERIAL_URANIUM = 8, MATERIAL_GOLD = 4)
	price_tag = 5000
	origin_tech = list(TECH_COMBAT = 7, TECH_PLASMA = 7, TECH_BLUESPACE = 8)
	charge_cost = 5
	fire_delay = 5
	init_recoil = HANDGUN_RECOIL(0.3)
	twohanded = FALSE
	suitable_cell = /obj/item/cell/small
	can_dual = TRUE
	w_class = ITEM_SIZE_NORMAL

	init_firemodes = list(
		list(mode_name="uo4E6SBeGe", mode_desc="c25F2OeGUi", burst=1, projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/guns/unknown_spacegun_burn.ogg',       fire_delay=5,  move_delay=null, charge_cost=3,  icon="stun",     projectile_color = "#0000FF"),
		list(mode_name="0sXYAJGCv4", mode_desc="yQI241FKDh", burst=1, projectile_type=/obj/item/projectile/plasma,       fire_sound='sound/weapons/guns/unknown_spacegun_melt.ogg',       fire_delay=10, move_delay=null, charge_cost=6,  icon="kill",     projectile_color = "#FF0000"),
		list(mode_name="XhddhrdJkJ", mode_desc="uDsfMdPQkm", burst=1, projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/guns/unknown_spacegun_incinerate.ogg', fire_delay=15, move_delay=null, charge_cost=9,  icon="destroy",  projectile_color = "#FFFFFF"),
		list(mode_name="bP6hfnj3Js", mode_desc="AhG8GjobYa", burst=3, projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/guns/unknown_spacegun_vaporize.ogg',   fire_delay=5,  move_delay=4,    charge_cost=11, icon="vaporize", projectile_color = "#FFFFFF")
	)
	serial_type = "if491JKJJJLK"
	serial_shown = FALSE

/obj/item/gun/energy/plasma/stranger/Initialize()
	. = ..()
	AddComponent(/datum/component/inspiration, list())
	RegisterSignal(src, COMSIG_ODDITY_USED, .proc/chaos)
	chaos()

/obj/item/gun/energy/plasma/stranger/proc/chaos()
	var/list/stats = ALL_STATS
	var/list/final_oddity = list()
	var/stat = pick(stats)
	final_oddity += stat
	final_oddity[stat] = 6
	var/area/my_area = get_area(src)
	if(my_area)
		var/bluespacemodifier = round(my_area.bluespace_entropy/(my_area.bluespace_hazard_threshold/4))
		final_oddity[stat] += bluespacemodifier
		my_area.bluespace_entropy = max(0, my_area.bluespace_entropy - (6 + bluespacemodifier))
	var/datum/component/inspiration/odd = GetComponent(/datum/component/inspiration)
	odd.stats = final_oddity

/obj/item/gun/energy/plasma/stranger/examine(user, distance)
	. = ..()
	var/area/my_area = get_area(src)
	switch(my_area.bluespace_entropy)
		if(0 to my_area.bluespace_hazard_threshold*0.3)
			to_chat(user, SPAN_NOTICE("It's fading out."))
		if(my_area.bluespace_hazard_threshold*0.7 to INFINITY)
			to_chat(user, SPAN_NOTICE("It's occasionally pulsing with energy."))
	if(GLOB.bluespace_entropy > GLOB.bluespace_hazard_threshold*0.7)
		to_chat(user, SPAN_NOTICE("It glows with an inner radiance."))
	if(my_area.bluespace_entropy > my_area.bluespace_hazard_threshold*0.95 || GLOB.bluespace_entropy > GLOB.bluespace_hazard_threshold*0.95)
		to_chat(user, SPAN_NOTICE("The energy surrounding it is overwhelming to the point of feeling warm in your hands."))

/obj/item/gun/energy/plasma/stranger/attack_hand(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	else
		var/mob/living/carbon/human/H = user
		H.sanity.valid_inspirations |= src

/obj/item/gun/energy/plasma/stranger/update_icon(ignore_inhands)
	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = 100
		else if(!cell)
			ratio = "empty"

		if(modifystate)
			icon_state = "[modifystate]-[ratio]"
		else
			icon_state = "[initial(icon_state)]-[ratio]"

		if(item_charge_meter)
			set_item_state("-[item_modifystate][ratio]")
	if(!item_charge_meter && item_modifystate)
		set_item_state("-[item_modifystate]")
	if(!ignore_inhands)
		update_wear_icon()
