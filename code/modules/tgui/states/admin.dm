/*!
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

/**
 * tgui state: admin_state
 *
 * Checks that the user is an admin, end-of-story.
 */

GLOBAL_DATUM_INIT(admin_state, /datum/ui_state/admin_state, new)

/datum/ui_state/admin_state/can_use_topic(src_object, mob/user)
	return check_rights(R_ADMIN, 0, user) ? UI_INTERACTIVE : UI_CLOSE

