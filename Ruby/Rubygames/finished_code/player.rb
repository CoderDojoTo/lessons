class Player
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/ghost.png", true)
    @left = 200
    @top = 200
  end

  def draw
    @icon.draw(@left, @top, 1)
  end

  def move_left
  	@left = @left - 3
  end

  def move_right
  	@left = @left - 3
  end

  def move_down
  	@top = @top + 3
  end

  def move_up
  	@top = @top - 3
  end

  def eaten_by?(pacman)
    Gosu::distance(@left, @top, pacman.left, pacman.top) < 50
  end
end
