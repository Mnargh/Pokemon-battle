class Game
  
  def attack(belligerent, victim)
    victim.hurt(belligerent.attack)
  end

end
