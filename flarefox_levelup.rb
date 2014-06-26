#==================================================================================
# Author: Flare_Fox
# Email: eugenepetrie@live.com
# Supporting Authors: Kerbonklin (for basic idea of the script)
# Title: Flare Fox Stat Saver
# Creation Date: 6/24/2014
# Version: 1.0.0
#==================================================================================
# KNOWN BUGS:
# 6/25/14
# 1. Script will still be called even if there are more than one actor being used.
#    This is an issue because it only runs the state and common event on the first
#    actor, and not the rest. Should be fixed soon.
#----------------------------------------------------------------------------------
# UPDATES:
# 6/25/14
# 1. Added an Editable Region and Updated the Instructions.
#----------------------------------------------------------------------------------
# INSTRUCTIONS:
# 
# In the editable region, beginning on line 38, you will be able to set the actor id
# that you use, the state id in which you placed the "level_up" state, and the common
# event id in which you place the "level_up" event.
#
# By default, the Actor_ID is set to one, Eric.
# For the moment, this can only affect one actor, I will be looking up how to fix this
# in future updates.
#
# By default, the State_ID is set to 26, the newest one after all the default states.
# This too, can only assign 1 state. Again, I will fix this in the next update.
#
# By default, the CommonEvent_ID is set to 1, the first Common Event in the database.
# The same issue is present here with common events as well.
#
# The only way to bypass this error is to create more constants and 
# $game_actors(Actor_ID).add_state(State_ID), which is not efficient.
# If you wish to do so, edit at your own risk!
#
# If any errors occur, please feel free to email me at eugenepetrie@live.com,
# or pm me, Flare_Fox.
#----------------------------------------------------------------------------------
# TERMS AND CONDITIONS:
#
# This script, and its contiguous materials (i.e. common events, variables, states)
# are free to use in FREE games, where the only thing I ask is to be given credit.
# For COMMERCIAL games, please email me.
#==================================================================================

#==================================================================================
# * Import Script to Global Space.
#----------------------------------------------------------------------------------
($imported ||= {}) [:flarefox_statsaver] = true
#==================================================================================

#==================================================================================
# ** Game_Actor
#----------------------------------------------------------------------------------
#  This class handles actors. It is used within the Game_Actors class
# ($game_actors) and is also referenced from the Game_Party class ($game_party).
#==================================================================================

class Game_Actor < Game_Battler

	#-------------------------------------------------------------------------
	# * Editable Region
	#-------------------------------------------------------------------------
	Actor_ID = 1
	State_ID = 26
	CommonEvent_ID = 1
	#-------------------------------------------------------------------------
	
	#========================================================================#
	# ** DO NOT EDIT BELOW HERE!!!!!!!!!!!									 #
	#========================================================================#

	#--------------------------------------------------------------------------
	# * Object Initialization
	#--------------------------------------------------------------------------
	alias flarefox_statesaver_initialize initialize
	def initialize(*args)
		p("Stat Saver Script Initialized")
		actor = flarefox_statesaver_initialize(*args)
		return actor
	end
	#--------------------------------------------------------------------------
	# * Level Up
	#--------------------------------------------------------------------------
	alias flarefox_statsaver_levelup level_up
	def level_up
		flarefox_statsaver_levelup()
		$game_actors[Actor_ID].add_state(State_ID)
		$game_temp.reserve_common_event(CommonEvent_ID)
		p("Stat Saver Level Up Called")
	end
end