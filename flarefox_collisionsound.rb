#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles the player. It includes event starting determinants and
# map scrolling functions. The instance of this class is referenced by
# $game_player.
#==============================================================================

class Game_Player < Game_Character

  #-------------------------------------------------------------------------
  # * Editable Region
  #-------------------------------------------------------------------------
  # ["File", volume, pitch]
  Collision_SE         = ["Cancel1", 80, 100]
  Collsison_wait_timer = 60
  #-------------------------------------------------------------------------
  
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  alias flarefox_collisionsound_initialize initialize
  def initialize
    flarefox_collisionsound_initialize()
	@collision_sound_timer = 0
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  alias flarefox_collisionsound_update update
  def update
    flarefox_collisionsound_update()
	@collision_sound_timer = 0 unless @collision_sound_timer != nil
	@collision_sound_timer -= 1 unless @collision_sound_timer = 0
  end
  
  #--------------------------------------------------------------------------
  # * Determine if Passable
  #     d : Direction (2,4,6,8)
  #--------------------------------------------------------------------------
  alias flarefox_collisionsound_passable passable?
  def passable?(*args)
    passable = flarefox_collisionsound_passable(*args)
	unless passable == true || @collision_sound_timer > 0
	  RPG::SE.new(*Collision_SE).play
	  @collision_sound_timer = Collsison_wait_timer
	end
	return passable
  end
end