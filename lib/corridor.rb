class Corridor

  def initialize
    intro
    take_action
  end

  def take_action
    Game.prompt
    action = gets.chomp
    case action
      when /help|\?/i                   then help
      when /shoot|blast/i               then shot_down
      when /dodge|dip|duck|dive|dodge/i then stomped
      when /joke|laugh|insult/i         then jokey
      else
        Game.say "I don't understand how that will help in this situation.\n"
        take_action # those who fail to understand recursion are doomed to repeat it
    end
  end

  def help
    Game.say "There is no one here to help you, only your blaster,
              your reflexes, and your sense of humor.\n"
    take_action
  end

  def intro
    Game.say "
      The Gothons of Planet Percal #25 have invaded your ship and destroyed
      your entire crew.  You are the last surviving member and your last
      mission is to get the neutron destruct bomb from the Weapons Armory,
      put it in the bridge, and blow the ship up after getting into an
      escape pod.

      You're running down the central corridor to the Weapons Armory when
      a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
      flowing around his hate filled body. He's blocking the door to the
      Armory and about to pull a weapon to blast you."
  end

  def shot_down
    Game.say "
      Quick on the draw you yank out your blaster and fire it at the Gothon.
      His clown costume is flowing and moving around his body, which throws
      off your aim.  Your laser hits his costume but misses him entirely.  This
      completely ruins his brand new costume his mother bought him, which
      makes him fly into an insane rage and blast you repeatedly in the face until
      you are dead. Then he eats you."
    Game.death
  end

  def stomped
    Game.say "
      Like a world class boxer you dodge, weave, slip and slide right
      as the Gothon's blaster cranks a laser past your head.
      In the middle of your artful dodge your foot slips and you
      bang your head on the metal wall and pass out.
      You wake up shortly after only to die as the Gothon stomps on
      your head and eats you."
    Game.death
  end

  def jokey
    Game.say "
      Lucky for you they made you learn Gothon insults in the academy.
      You tell the one Gothon joke you know:
      Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
      The Gothon stops, tries not to laugh, then busts out laughing and can't move.
      While he's laughing you run up and shoot him square in the head
      putting him down, then jump through the Weapon Armory door."
    LaserArmory.new
  end
end