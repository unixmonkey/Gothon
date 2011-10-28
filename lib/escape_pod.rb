class EscapePod

  def initialize
    @escape_pod_number = (rand(5)+1).to_s
    intro
    take_guess
  end

  def intro
    Game.say "You rush through the ship desperately trying to make it to
      the escape pod before the whole ship explodes. It seems like
      hardly any Gothons are on the ship, so your run is clear of
      interference. You get to the chamber with the escape pods, and
      now need to pick one to take. Some of them could be damaged
      but you don't have time to look. There are 5 pods, which one
      do you take?"
  end

  def take_guess
    print "[pod #]>"
    guess = gets.chomp
    case guess
      when /correct|right/i
        correct_pod
      when @escape_pod_number
        good_pod
      when /\d/ # any other number
        bad_pod
      else
        Game.say "Quit playing games and pick a pod!"
        take_guess
    end
  end

  def help
    Game.say "That's the trouble with randomness; you can never be sure!"
    take_guess
  end

  def bad_pod
    Game.say "You jump into escape pod #{@escape_pod_number} and hit the eject button.
      The pod escapes out into the void of space, then
      implodes as the hull ruptures, crushing your body
      into a jelly."
    Game.death
  end

  def correct_pod
    Game.say "Trusting to instinct, you hop into the pod directly across
      the room. Slamming the eject button as soon as the hatch closes,
      you quickly leave the ship behind. In the distance, you watch
      as it explodes into a fiery supernova. Thankfully, the blast
      is too far away to affect your escape pod.
      Congratulations! You won!"
    Game.over
  end

  def good_pod
    Game.say "You jump into pod #{guess.to_i} and hit the eject button.
      The pod easily slides out into space, heading to
      the planet below. As it flies to the planet, you look
      back and see your ship implode, then explode like a
      bright star, taking out the Gothon ship at the same time.
      You won!"
    Game.over
  end

end