class Player
  attr_reader :name, :health, :attack
  def initialize(name)
  	@name = name
  	@health = 100
    @attack = 10
  end

  def hurt(value)
  	@health -= value
  end

end
