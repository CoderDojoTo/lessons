class Player
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/ghost.png", true)
    @right = 200
    @top = 200
  end

  def draw
    @icon.draw(@right, @top, 1)
  end

  def move_right
  	@right = @right + 3
  end

  def move_left
  	@right = @right - 3
  end

  def move_down
  	@top = @top + 3
  end

  def move_up
  	@top = @top - 3
  end
end