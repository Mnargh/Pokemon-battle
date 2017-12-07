require './lib/player'

class Game
  attr_reader :player1, :player2

  def initialize(p1,p2, player_class = Player)
  	@player1 = player_class.new(p1)
  	@player2 = player_class.new(p2)
  end

  def p1_attack
  	attack(@player1, @player2)
  end

  def attack(belligerent, victim)
    victim.hurt(belligerent.attack)
  end

end
