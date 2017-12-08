require './lib/player'

class Game
  attr_reader :turn

  def self.create_new_game(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance_of_game
    @game
  end

  def initialize(p1,p2, player_class = Player)
    # for future could use *players to pass in multiple players
    @players = [player_class.new(p1), player_class.new(p2)]
    @turn = 1
  end

  def next_players_turn
    @turn += 1
    @turn = 1 if @turn > @players.count
  end

  def player(player_number)
    @players[player_number - 1]
  end

  def fight(victim)
  	attack(player(turn), victim)
    @attack_string = "#{player(turn).name} attacked #{victim.name}!"
    next_players_turn
  end

  def attack(belligerent, victim)
    victim.hurt(belligerent.attack)
  end

  def loser
  	@players.select {|player| player.health <=0}.first
  end

  def whose_turn_string
    "It's #{player(turn).name}'s turn!"
  end

  def title_string
    "#{player(1).name} vs #{player(2).name}..."
  end

  def health_string(player_number)
    "#{player(player_number).name} HP: #{player(player_number).health}/100"
  end

  def attack_string
    @attack_string
  end
end
