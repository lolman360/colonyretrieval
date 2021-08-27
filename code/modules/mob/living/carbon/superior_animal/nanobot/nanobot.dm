/mob/living/carbon/superior_animal/nanobot
	name = "Nanobot"
	desc = "A robot built from Nanites"
	icon = 'icons/mob/custom_bot.dmi'
	icon_state = "soteria_sword_handmade"
	attack_sound = 'sound/weapons/blade1.ogg'
	faction = "neutral"
	pass_flags = PASSTABLE
	health = 200
	maxHealth = 200
	melee_damage_lower = 10
	melee_damage_upper = 20
	turns_per_move = 5
	see_in_dark = 10
	wander = FALSE
	stop_automated_movement_when_pulled = TRUE
	armor = list(melee = 30, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100)
	mob_classification = CLASSIFICATION_SYNTHETIC
	breath_required_type = 0 // Doesn't need to breath
	breath_poison_type = 0 // Can't be poisoned
	min_air_pressure = 0 // Doesn't need pressure
	speak_emote = list("state")
	emote_see = list("looks around for a target.")
	speak_chance = 1
	attacktext = "slashed"
	meat_amount = 0
	mob_size = MOB_MEDIUM
	can_burrow = FALSE
	randpixel = 0
	deathmessage = "blows apart!"
	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT

	do_gibs = FALSE
	colony_friend = TRUE
	friendly_to_colony = TRUE

	known_languages = list(LANGUAGE_COMMON)

	follow_message = "state, \"Beginning Escort Protocol.\""
	stop_message = "state, \"Ending Escort Protocol.\""
	follow_distance = 2
	var/list/creator = list() // Who's the bot's creator.
	var/repair_rate = 0 // How fast does the bot repair itself.
	var/hearing_flag = 0 // Flags for voice-activated functions
	var/obj/item/device/radio/R // Var for the built-in radio

	// Vars for the medical function
	var/medbot = FALSE // Does it act like a medbot?
	var/mob/living/carbon/human/patient = null
	var/currently_healing = FALSE
	var/injection_amount = 15 //How much reagent do we inject at a time?
	var/heal_threshold = 10 //Start healing when they have this much damage in a category
	var/treatment_brute = "tricordrazine"
	var/treatment_oxy = "tricordrazine"
	var/treatment_fire = "tricordrazine"
	var/treatment_tox = "tricordrazine"
	var/treatment_virus = "spaceacillin"

/mob/living/carbon/superior_animal/nanobot/New()
	. = ..()
	R = new/obj/item/device/radio(src)

/mob/living/carbon/superior_animal/nanobot/examine(mob/user)
	..()
	if(iscarbon(user) || issilicon(user))
		var/robotics_expert = user.stats.getPerk(PERK_ROBOTICS_EXPERT)
		if(robotics_expert) // Are we an expert in robots?
			to_chat(user, SPAN_NOTICE("[name] is currently at [(health/maxHealth)*100]% integrity!")) // Give a more accurate reading.
		else if (health < maxHealth * 0.25)
			to_chat(user, SPAN_DANGER("It's grievously wounded!"))
		else if (health < maxHealth * 0.50)
			to_chat(user, SPAN_DANGER("It's badly wounded!"))
		else if (health < maxHealth * 0.75)
			to_chat(user, SPAN_WARNING("It's wounded."))
		else if (health < maxHealth)
			to_chat(user, SPAN_WARNING("It's a bit wounded."))

// For repairing damage to the bot.
/mob/living/carbon/superior_animal/nanobot/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(
										SPAN_NOTICE("[user] [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [src.name]."),
										SPAN_NOTICE("You [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [src.name].")
										)
					if(user.stats.getPerk(PERK_ROBOTICS_EXPERT))
						heal_overall_damage(50, 50)
					else
						heal_overall_damage(rand(30, 50), rand(30, 50))
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return

		else if(QUALITY_PULSING in T.tool_qualities)
			follow_distance = input(user, "How far should [src.name] follow?", "Distance to set", initial(follow_distance)) as null | anything in list(0, 1, 2, 3, 4, 5)
			if(density && follow_distance < 1)
				follow_distance = 1 // Making sure that the bot don't try to occupy your tile if it can't share it.
			return

	// If nothing was ever triggered, continue as normal
	..()

/mob/living/carbon/superior_animal/nanobot/proc/spawn_food(var/random = FALSE)
	var/obj/item/reagent_containers/food/snacks/spawned_food // The food we're spawning
	if(random) // Are we spawning random food?
		var/list/possible_food = typesof(/obj/item/reagent_containers/food/snacks) // Create a list of possible food to spawn
		possible_food -= /obj/item/reagent_containers/food/snacks // Remove the default type from the list
		spawned_food = pick(possible_food) // Select a random food.

	else // We're spawning a specific food.
		spawned_food = /obj/item/reagent_containers/food/snacks/mre/can
	spawned_food = new(src.loc) // Spawn the food
	visible_emote("state, \"Dispensing [spawned_food.name].\"") // Vocal Message
