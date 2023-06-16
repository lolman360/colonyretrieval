
#define COMSIG_ATOM_ENTERED "atom_entered"                      //from base of atom/Entered(): (atom/movable/entering, /atom)
#define COMSIG_ATOM_EXIT "atom_exit"							//from base of atom/Exit(): (/atom/movable/exiting, /atom/newloc)
	#define COMPONENT_ATOM_BLOCK_EXIT 1
#define COMSIG_ATOM_EXITED "atom_exited"						//from base of atom/Exited(): (atom/movable/exiting, atom/newloc)




#define COMSIG_MOVABLE_CROSSED "movable_crossed"                //from base of atom/movable/Crossed(): (/atom/movable)
#define COMSIG_MOVABLE_UNCROSS "movable_uncross"				//from base of atom/movable/Uncross(): (/atom/movable)
#define COMSIG_MOVABLE_UNCROSSED "movable_uncrossed"            //from base of atom/movable/Uncrossed(): (/atom/movable)


#define COMSIG_ITEM_WEARERCROSSED "wearer_crossed"				//called on item when crossed by something (): (/atom/movable)