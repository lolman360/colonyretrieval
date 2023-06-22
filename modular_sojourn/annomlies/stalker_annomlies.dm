/obj/structure/stalker_anomaly
	name = "Coder Anomaly"
	desc = "Something not meant to be seen by the eyes of players, \
	sad."
	icon = 'modular_sojourn/annomlies/stalker_annomlies.dmi'
	var/active = FALSE
	var/activated_since_last_artifactcheck = FALSE
	var/last_activation
	var/cooldown
	pixel_x = 8
	pixel_y = 8

/obj/structure/stalker_anomaly/Crossed(atom/movable/AM)
	if(!isliving(AM) || !isobj(AM))
		return
	if(last_activation + cooldown >= world.time)
		last_activation = world.time
		trigger_anomaly(AM)
	..()

/obj/structure/stalker_anomaly/proc/trigger_anomaly(var/atom/movable/AM)
	return

/obj/structure/stalker_anomaly/flashy_coin
	name = "Flash"
	desc = "An anomalous black hole in the ground, no light can shine down it, \
	yet a small orb of light bounces up out of it every now and again."
	icon_state = "flash_hole"
	item_state = "flash_hole"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	cooldown = 9 SECONDS
	layer = FLY_LAYER

/obj/structure/stalker_anomaly/flashy_coin/trigger_anomaly(mob/living/L)
	flick("flash_hole_trigger", src)
	visible_message(SPAN_DANGER("The anomaly activates in a flash of blinding light!"))
	for(var/mob/M in living_mobs_in_view(3, src))
		if(iscarbon(M))
			flashy_stun(M)

/obj/structure/stalker_anomaly/flashy_coin/proc/flashy_stun(mob/living/carbon/M) //Flashbang_bang but bang-less.
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/eye_safety = 0
		eye_safety = H.eyecheck()
		if(eye_safety >= FLASH_PROTECTION_MAJOR)
			return
		H.flash(3, TRUE , TRUE , TRUE, 15)
		H.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		H.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		H.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		H.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
	else
		M.flash(5, TRUE, TRUE , TRUE)
		M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		M.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		M.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
	M.update_icons()

/obj/structure/stalker_anomaly/haze
	name = "Haze"
	desc = "A spot of hazy air, as if heatwaves rising from a hot asphalt road. Just getting close to it gives off a profound sense of warmth."
	icon_state = "haze"
	item_state = "haze"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	alpha = 75
	layer = FLY_LAYER
	cooldown = 12 SECONDS
	var/heavy_range = 3
	var/weak_range = 4
	var/flash_range = 0
	var/heat_damage = 40
	var/fire_stacks = TRUE
	var/penetration = 1

/obj/structure/stalker_anomaly/haze/trigger_anomaly()
	var/turf/T = get_turf(src)
	heatwave(T, heavy_range, weak_range, heat_damage, fire_stacks, penetration)
	visible_message(SPAN_WARNING("The very air around the [T.name] ripples and shifts as it radiates a searing heat!"))


/obj/structure/stalker_anomaly/spidersilk
	name = "Fairy silk"
	desc = "A pretty collection of floating lights, dangling from random points in the air, they glow softly, and are very pretty. Sadly they also get in the way."
	icon_state = "fairy_light"
	item_state = "fairy_light"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/starter = TRUE
	var/is_growing = TRUE
	var/spread_range = 1
	var/spread_speed_slow = 100		// Minium amount of time it takes for a grown crystal to spread
	var/spread_speed_high = 280		// Maxium amount of time it takes for a grown crystal to spread
	light_power = 1
	light_range = 2
	light_color = "#F5B31E"

	pixel_x = 0
	pixel_y = 0

/obj/structure/stalker_anomaly/spidersilk/Initialize()
	..()
	if(is_growing)
		START_PROCESSING(SSobj, src)

/obj/structure/stalker_anomaly/spidersilk/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/stalker_anomaly/spidersilk/Process()
	if(prob(10))
		spread()

/obj/structure/stalker_anomaly/spidersilk/non_spreader
	is_growing = FALSE
	starter = FALSE

/obj/structure/stalker_anomaly/spidersilk/spreaded
	starter = FALSE

/obj/structure/stalker_anomaly/spidersilk/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(isliving(mover))
		if(prob(80))
			to_chat(mover, SPAN_WARNING("You get stuck in \the [src] for a moment."))
			return 0
	else if(istype(mover, /obj/item/projectile))
		return prob(60)
	return 1

/obj/structure/stalker_anomaly/spidersilk/proc/spread()
	if(!src) //Just in case
		return
	if(!is_growing)
		return
	var/list/turf_list = list()
	var/spidersilk
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(!can_pixy_dance_to(T))
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)

		spidersilk = /obj/structure/stalker_anomaly/spidersilk // We spread are basic type

		if(is_growing)
			spidersilk = /obj/structure/stalker_anomaly/spidersilk/spreaded
			if(prob(60) && !starter)
				spidersilk = /obj/structure/stalker_anomaly/spidersilk/non_spreader

		if(spidersilk && is_growing)
			new spidersilk(T) // We spread
			if(prob(50) && !starter)
				is_growing = FALSE

	if(spidersilk && is_growing) //Anti-lag breaking the chain
		if(prob(50))
			light_color = "#391285"
		if(prob(40))
			light_color = "#FFE4E1"


// Check the given turf to see if there is any special things that would prevent the spread
/obj/structure/stalker_anomaly/spidersilk/proc/can_pixy_dance_to(var/turf/T)
	if(T)
		if(istype(T, /turf/space)) // We can't spread in SPACE!
			return FALSE
		if(istype(T, /turf/simulated/open)) // Crystals can't float. Yet.
			return FALSE
		if(locate(/obj/structure/stalker_anomaly/spidersilk) in T) // No stacking.
			return FALSE
	return TRUE

/obj/structure/stalker_anomaly/ball_lightning
	name = "ball lightning"
	desc = "A floating ball of arcing electricity, it quickly drifts through the air like a cloud, with its faint blue glow and distinct smell of ionized air."
	icon_state = "ball_lightning"
	item_state = "ball_lightning"
	density = TRUE
	anchored = FALSE
	throwpass = FALSE
	layer = FLY_LAYER
	var/movement_range = 3
	var/movement_speed_as_in_when_it_moves_not_how_active_it_moves = 2
	var/movement_activity = 180
	allow_spin = FALSE
	light_power = 2
	light_range = 3
	light_color = "#7DF9FF"
	var/lighting_in_a_bottle
	var/datum/effect/effect/system/spark_spread/spark_system

/obj/structure/stalker_anomaly/ball_lightning/New()
	lighting_in_a_bottle = new /obj/item/cell/large/greyson(src)
	addtimer(CALLBACK(src, .proc/wings), movement_activity)
	spark_system = new()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	..()

/obj/structure/stalker_anomaly/ball_lightning/Destroy()
	if(lighting_in_a_bottle)
		qdel(lighting_in_a_bottle)
		lighting_in_a_bottle = null
	QDEL_NULL(spark_system)
	..()

/obj/structure/stalker_anomaly/ball_lightning/proc/wings()
	if(!src) //Just in case
		return
	var/list/turf_list = list()
	for(var/turf/T in orange(movement_range, get_turf(src)))
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)
		///atom/movable/proc/throw_at(atom/target, range, speed, thrower)
		throw_at(T, movement_range, movement_speed_as_in_when_it_moves_not_how_active_it_moves, src)


	addtimer(CALLBACK(src, .proc/wings), movement_activity)

/obj/structure/stalker_anomaly/ball_lightning/Bumped(atom/user)
	if (electrocute_mob(user, lighting_in_a_bottle, src)) //electrocute_mob() handles removing charge from the cell, no need to do that here.
		spark_system.start()

/obj/structure/stalker_anomaly/ball_lightning/Bump(atom/user)
	if (electrocute_mob(user, lighting_in_a_bottle, src)) //electrocute_mob() handles removing charge from the cell, no need to do that here.
		spark_system.start()

/obj/structure/stalker_anomaly/hell
	name = "Radiant"
	desc = "A floating orb of warm yellow light, yet the area around it seems to be covered in a thin layer of frost."
	icon_state = "radient"
	item_state = "radient"
	light_power = 3
	light_range = 6
	light_color = "#FEA91A"
	density = TRUE
	var/cooling_on_bump = 270
	//We add all 3 together
	var/long_range_cooling = 20
	var/medium_range_cooling = 20
	var/close_range_cooling = 20
	//
	cooldown = 12 SECONDS

//user bodytemperature = 310.055 rounding ish in shift so were basing it on this

/obj/structure/stalker_anomaly/hell/trigger_anomaly(atom/movable/AM)
	visible_message(SPAN_DANGER("The air above the [loc.name] flash-freezes! Ice crystals fall out of the air, and a wall of cold spreads outwards."))
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		H.bodytemperature -= 275 //This is in Kittens not Cats or Felines
	//Yes we stack each time, get cryo'ed
	for(var/mob/M in living_mobs_in_view(3, src))
		orb(M, long_range_cooling)
	for(var/mob/M in living_mobs_in_view(2, src))
		orb(M, medium_range_cooling)
	for(var/mob/M in living_mobs_in_view(1, src))
		orb(M, close_range_cooling)

/obj/structure/stalker_anomaly/hell/proc/orb(mob/living/carbon/M, temp_to_use)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.bodytemperature -= temp_to_use



/obj/structure/stalker_anomaly/thumper
	name = "Thumper"
	desc = "A glistening cloud of gold vapors. Small arcs of electricity dance around inside it as it slams itself forcefully into the ground, over and over."
	icon_state = "crusher_cloud"
	item_state = "crusher_cloud"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	cooldown = 6 SECONDS
	var/clunk = 1
	var/smash_damage = 15
	var/star_strike = 2
	var/striek_nerves_odds = 100

/obj/structure/stalker_anomaly/thumper/Crossed(mob/M)
	.=..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		to_chat(H, SPAN_NOTICE("\The [src] knocks you down when try to walk under it!"))
		H.trip(src, clunk)
		H.take_overall_damage(smash_damage)
		H.confused += star_strike
		H.updatehealth()

/obj/structure/stalker_anomaly/thumper/proc/gravitational_theory(mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.trip(src, clunk)
		H.take_overall_damage(smash_damage)
		H.confused += star_strike
		H.updatehealth()
		if(prob(striek_nerves_odds))
			var/obj/item/organ/external/organ = H.get_organ(pick(BP_LEGS))
			if(!organ || organ.is_nerve_struck() || organ.nerve_struck == -1)
				return
			else
				organ.nerve_strike_add(1)

/obj/structure/stalker_anomaly/thumper/trigger_anomaly(atom/movable/AM)
	visible_message(SPAN_WARNING("\red [src] SLAMS down shaking the ground!"))
	for(var/mob/M in living_mobs_in_view(3, src))
		gravitational_theory(M)


/obj/structure/stalker_anomaly/echo
	name = "Echo"
	desc = "Shimmering blue cubes, you feel you aren't meant to see them like this."
	icon_state = "echo"
	density = FALSE
	anchored = TRUE

	pixel_x = 0
	pixel_y = 0

	var/can_use = TRUE
	var/saved_name
	var/saved_description
	var/saved_item
	var/saved_type
	var/saved_icon
	var/saved_icon_state
	var/saved_layer
	var/saved_original_plane
	var/saved_dir
	var/saved_message
	var/saved_appearance
	var/saved_item_state
	var/saved_w_class
	var/spider_appearance
	var/saved_gender

	var/dummy_active = FALSE
	var/scan_mobs = TRUE




/obj/structure/stalker_anomaly/echo/trigger_anomaly(atom/movable/AM)
	if(istype(M, /mob/observer) || istype(M, /obj/item/projectile))
		return

	duplicate(M, M)

/obj/structure/stalker_anomaly/echo/proc/duplicate(atom/target, mob/user)
	if(istype(target, /obj/item/storage))
		return
	if(dummy_active || !scan_mobs)
		disrupt()
	reset_data()
	playsound(get_turf(src), 'sound/weapons/flash.ogg', 100, 1, -6)
	saved_name = target.name
	saved_item = target
	saved_type = target.type
	saved_icon = target.icon
	saved_icon_state = target.icon_state
	saved_description = target.desc
	saved_dir = target.dir
	saved_appearance = target.appearance
	saved_gender = target.gender
	spider_appearance = src.appearance
	saved_layer = target.layer
	saved_original_plane = target.original_plane
	if(isobj(target))
		var/obj/O = target
		saved_item_state = O.item_state
		saved_w_class = O.w_class
	if(ismob(target))
		saved_message = target.examine(user)
	toggle()
	return

/obj/structure/stalker_anomaly/echo/proc/toggle()
	if(!can_use || !saved_item)
		return
	if(dummy_active)
		dummy_active = FALSE
		appearance = spider_appearance
		name = initial(name)
		desc = initial(desc)
		icon = initial(icon)
		icon_state = initial(icon_state)
		layer = initial(layer)
		plane = calculate_plane(z, original_plane)
		item_state = initial(item_state)
		set_dir(initial(dir))
		update_icon()
	else
		if(!saved_item)
			return
		else
			activate_holo(saved_name, saved_icon, saved_icon_state, saved_description, saved_dir, saved_appearance, saved_item_state)

/obj/structure/stalker_anomaly/echo/proc/activate_holo(new_name, new_icon, new_iconstate, new_description, new_dir, new_appearance, new_item_state)
	name = new_name
	desc = new_description
	icon = new_icon
	icon_state = new_iconstate
	item_state = new_item_state
	appearance = new_appearance
	set_dir(new_dir)
	plane = calculate_plane(z, saved_original_plane)
	layer = saved_layer
	dummy_active = TRUE

/obj/structure/stalker_anomaly/echo/proc/reset_data()
	saved_name = initial(saved_name)
	saved_item = initial(saved_item)
	saved_type = initial(saved_type)
	saved_icon = initial(saved_icon)
	saved_icon_state = initial(saved_icon_state)
	saved_description = initial(saved_description)
	saved_dir = initial(saved_dir)
	saved_message = initial(saved_message)
	saved_appearance = initial(appearance)
	saved_item_state = initial(item_state)
	saved_w_class = initial(saved_w_class)
	saved_gender = initial(saved_gender)
	saved_layer = initial(saved_layer)
	saved_original_plane = initial(saved_original_plane)

/obj/structure/stalker_anomaly/echo/examine(mob/user, var/distance = -1)
	if(dummy_active && saved_item && saved_message)
		to_chat(user, saved_message)
	else if(dummy_active && saved_item)
		var/message
		var/size
		if(istype(saved_item, /obj/item))
			switch(saved_w_class)
				if(ITEM_SIZE_TINY)
					size = "tiny"
				if(ITEM_SIZE_SMALL)
					size = "small"
				if(ITEM_SIZE_NORMAL)
					size = "normal-sized"
				if(ITEM_SIZE_BULKY)
					size = "bulky"
				if(ITEM_SIZE_HUGE)
					size = "huge"
				if(ITEM_SIZE_GARGANTUAN)
					size = "gargantuan"
				if(ITEM_SIZE_COLOSSAL)
					size = "colossal"
				if(ITEM_SIZE_TITANIC)
					size = "titanic"
			message += "\nIt is a [size] item."

			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				if(H.stats.getPerk(PERK_MARKET_PROF))
					message += SPAN_NOTICE("\nThis item cost: [get_item_cost(saved_item)][CREDITS]")

		var/full_name = "\a [src]."
		if(blood_DNA)
			if(saved_gender == PLURAL)
				full_name = "some "
			else
				full_name = "a "
			if(blood_color != "#030303")
				full_name += "<span class='danger'>blood-stained</span> [name]!"
			else
				full_name += "oil-stained [name]."

		if(isobserver(user))
			to_chat(user, "\icon[src] This is [full_name] [message]")
		else
			user.visible_message("<font size=1>[user.name] looks at [src].</font>", "\icon[src] This is [full_name] [message]")

		to_chat(user, show_stat_verbs()) //rewrite to show_stat_verbs(user)?

		if(desc)
			to_chat(user, desc)

		LEGACY_SEND_SIGNAL(src, COMSIG_EXAMINE, user, distance)
	else
		. = ..()

/obj/structure/stalker_anomaly/echo/proc/disrupt()
	if(dummy_active)
		toggle()
		can_use = 0
		spawn(1 SECONDS)
			can_use = 1

/obj/structure/stalker_anomaly/echo/attackby()
	..()
	disrupt()

/obj/structure/stalker_anomaly/echo/ex_act()
	..()
	disrupt()


/obj/structure/stalker_anomaly/whirli
	name = "Whirli"
	desc = "An intense vortex of air, dust and debris spirals around this area. Even just standing around it gives the intense feeling of a powerful vacuum force pulling you in."
	icon_state = "whirli"
	item_state = "whirli"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	cooldown = 1 SECOND
	var/vortex_damage = 50
	var/confusion_add = 2
	alpha = 75

/obj/structure/stalker_anomaly/whirli/trigger_anomaly(atom/movable/AM)
	if(AM.allow_spin && allow_spin)
		AM.SpinAnimation(10,5)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		H.take_overall_damage(vortex_damage)
		H.stunned = 1
		H.confused += confusion_add
		H.updatehealth()
		if(prob(80))
			var/obj/item/organ/external/organ = H.get_organ(pick(BP_R_LEG, BP_L_LEG, BP_R_ARM, BP_L_ARM))
			if(!organ)
				H.visible_message(SPAN_DANGER("[H.name] is spun around by a gust of wind swirling around the [loc.name]!"), SPAN_DANGER("You're spun around by a gust of wind swirling around the [loc.name]!"))
				return
			organ.droplimb(TRUE, DISMEMBER_METHOD_EDGE)
			H.visible_message(SPAN_DANGER("[H.name] is spun around by a gust of wind swirling around the [loc.name], a sickening sound coming from a limb being ripped off by vacuum force!"), SPAN_DANGER("The gust of wind swirling around the [loc.name] thrashes you around, ripping one of your limbs off in the process!"))
		else
			H.visible_message(SPAN_DANGER("[H.name] is spun around by a gust of wind swirling around the [loc.name]!"), SPAN_DANGER("You're spun around by a gust of wind swirling around the [loc.name]!"))

/obj/structure/stalker_anomaly/razer
	name = "Razer"
	desc = "Field of floating red wires, there is a distinct smell of iron in the area around them."
	icon_state = "razer"
	item_state = "razer"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/starter = TRUE
	var/is_growing = TRUE
	var/spread_range = 1

	var/slice_damage = 5

	light_power = 2
	light_range = 3
	light_color = "#AA4A44"
	pixel_x = 0
	pixel_y = 0

/obj/structure/stalker_anomaly/razer/Initialize()
	. = ..()
	if(is_growing)
		START_PROCESSING(SSobj, src)

/obj/structure/stalker_anomaly/razer/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/stalker_anomaly/razer/Process()
	if(prob(80))
		spread()

/obj/structure/stalker_anomaly/razer/non_spreader
	is_growing = FALSE
	starter = FALSE

/obj/structure/stalker_anomaly/razer/spreaded
	starter = FALSE

/obj/structure/stalker_anomaly/razer/Crossed(mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/our_cutting = M
		if(MOVING_QUICKLY(M))
			to_chat(our_cutting, SPAN_WARNING("The red beam of light cuts into you."))
			our_cutting.adjustBruteLoss(slice_damage)
			if(!(our_cutting.species && our_cutting.species.flags & NO_BLOOD)) //We want the var for safety but we can do without the actual blood.
				our_cutting.adjustBruteLoss(slice_damage) //FPB's get hit 2x
				return
			our_cutting.drip_blood(15)
	.=..()

/obj/structure/stalker_anomaly/razer/proc/spread()
	if(!src) //Just in case
		return
	if(!is_growing)
		return
	var/list/turf_list = list()
	var/spidersilk
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(!can_twirl_to(T))
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)

		spidersilk = /obj/structure/stalker_anomaly/razer // We spread the basic type

		if(is_growing)
			spidersilk = /obj/structure/stalker_anomaly/razer/spreaded
			if(prob(60) && !starter)
				spidersilk = /obj/structure/stalker_anomaly/razer/non_spreader

		if(spidersilk && is_growing)
			new spidersilk(T) // We spread
			if(prob(50) && !starter)
				is_growing = FALSE

// Check the given turf to see if there is any special things that would prevent the spread
/obj/structure/stalker_anomaly/razer/proc/can_twirl_to(var/turf/T)
	if(T)
		if(istype(T, /turf/space)) // We can't spread in SPACE!
			return FALSE
		if(istype(T, /turf/simulated/open)) // Crystals can't float. Yet.
			return FALSE
		//Lets not stack this
		if(locate(/obj/structure/stalker_anomaly/razer) in T)
			return FALSE
		if(locate(/obj/structure/stalker_anomaly/spidersilk) in T) // No stacking.
			return FALSE
	return TRUE

