class Bridge

  def initialize
    intro
    take_action
  end

  def intro
    Game.say "You burst onto the Bridge with the neutron destruction bomb
      under your arm and surprise 5 Gothons who are trying to
      take control of the ship. Each of them has an even uglier
      clown costume than the last. They haven't pulled their
      weapons out yet, as they see the active bomb under your
      arm and don't want to set it off. What do you do?"
  end

  def take_action
    Game.prompt
    action = gets.chomp
    case action
      when /help|\?/    then help
      when /throw/i     then throw_bomb
      when /place|set/i then place_bomb
      else
        Game.say "DOES NOT COMPUTE!\n"
        take_action
    end
  end

  def help
    Game.say "You can't get past them; the bomb is the only leverage you have."
    take_action
  end

  def throw_bomb
    Game.say "In a panic, you throw the bomb at the group of Gothons
      and make a leap for the door. Right as you drop it, a
      Gothon shoots you right in the back, killing you.
      As you die you see another Gothon frantically try to disarm
      the bomb. You die knowing they will probably blow up when
      it goes off."
    Game.death
  end

  def place_bomb
    Game.say "You point your blaster at the bomb under your arm
      and the Gothons put their hands up and start to sweat.
      You inch backward to the door, open and then carefully
      place the bomb on the floor, pointing your blaster at it.
      You then jump back through the door, punch the close button
      and blast the lock so the Gothons can't get out.
      Now that the bomb is placed, you run to the escape pod to
      get off this tin can."
    EscapePod.new
  end


end