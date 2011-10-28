class BridgeAccess

  def initialize
    intro
    take_action
  end

  def intro
    Game.say "
      You round the corner, ready to make your way to the bridge and to the escape
      pods that lie beyond. Unfortunately, you see a huge pile of debris blocking
      your way. Luckily, you can see a panel that covers a maintenance tunnel is
      slightly askew. The tunnel appears to be unoccupied, but you can never tell
      with Gothons. You could also try to make your way over the pile of debris.
      Or you could wait here for the cleaning service to come and clear the trash
      out of your way."
  end

  def take_action
    Game.prompt
    action = gets.chomp
    case action
      when /help|\?/ then help
      when /tunnel/i then enter_tunnel
      when /climb/i  then climb_debris
      when /wait/i   then wait_here
      else
        Game.say "DOES NOT COMPUTE!\n"
        take_action
    end
  end

  def help
    Game.say "This isn't grade school anymore. You wear big-boy pants. Make a decision!"
    take_action
  end

  def enter_tunnel
    Game.say "
      The access tunnel is dark, but you manage to make your way through.
      Luckily, it seems those unsettling noises were just the ship coming
      apart, and not a hungry alien in a hideous clown costume ready to
      leap out and tear you to shreds."
    Bridge.new
  end

  def climb_debris
    Game.say "
      You bravely begin to climb the mountain of rubble, but about halfway
      up, you slip and fall. You narrowly miss impaling yourself on a bit of
      rebar. Breathing a sigh of relief, you realize you've got bigger problems.
      The rubble shifts beneath you, effectively crushing your lower body.
      You've got no choice but to wait for the sweet release of death."
    Game.death
  end

  def wait_here
    Game.say "
      You realize I was kidding, right?
      Leaning up against the wall, you wait for the cleaning crew to arrive.
      Fortunately, you don't have to wait long as a team of Gothons are along
      momentarily and blast you into vapor."
    Game.death
  end

end