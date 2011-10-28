class LaserArmory

  def initialize
    @guesses = 10
    intro
    present_keypad
  end

  def intro
    Game.say "
      You do a dive roll into the Weapon Armory, crouch and scan the room
      for more Gothons that might be hiding.  It's dead quiet, too quiet.
      You stand up and run to the far side of the room and find the
      neutron bomb in its container.  There's a keypad lock on the box
      and you need the code to get the bomb out.  If you get the code
      wrong 10 times then the lock closes forever and you can't
      get the bomb.  The code is 3 digits."
  end

  def code
    "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]
  end

  def present_keypad
    print "[keypad]> "
    guess = gets.chomp
    case guess
      when code
        correct_code
      when /reset/
        reset
      when /\D/ # anything other than 3 consecutive numbers
        Game.say "There are no letters on a keypad. What are you even doing?\n"
        present_keypad
      else
        try_keypad
    end
  end

  def try_keypad
    if @guesses == 1
      failure
      Game.death
    else
      @guesses -= 1
      Game.say "BZZZZZZEDDDD! The door remains sealed. You have #{@guesses} more chances\n"
      present_keypad
    end
  end

  def failure
    Game.say "
      The lock buzzes one last time and then you hear a sickening
      melting sound as the mechanism is fused together.
      You decide to sit there, and finally the Gothons blow up the
      ship from their ship and you die."
    Game.death
  end

  def correct_code
    Game.say "
      The container clicks open and the seal breaks, releasing a cloud of gas.
      You grab the neutron bomb and run as fast as you can to the
      bridge where you must place the bomb in the right spot."
    BridgeAccess.new
  end

  def reset
    Game.say "
      You hear a soft click as the neutron bomb's container
      opens, revealing the bomb inside. You're not quite sure
      how you did it, but you just hacked the Gibson."
    BridgeAccess.new
  end

end