class Game

  attr_accessor :corridor

  DEATH_QUIPS = [
    "You died. You kind of suck at this.",
    "Nice job! You died again!",
    "What a loser!",
    "I have a small puppy that's better at this."
  ]

  def initialize
    # start in the corridor
    Corridor.new
  end

  # remove leading whitespace and add extra lines
  def self.say(string)
    puts "\n\n" + string.gsub(/^\s*/,'') + "\n\n"
  end

  def self.prompt
    print '> '
  end

  def self.death
    Game.say DEATH_QUIPS[rand(DEATH_QUIPS.length)]
    3.downto(1) do |n|
      puts '.'
      sleep n
    end
    say "Through some kind of magic you are transported back
         in time into your own body, and the attack has just begun!\n"
    Game.new
  end

  def self.over
    say "************* Good job, jerk! *************"
    exit
  end
end