class Pacman
  def initialize(window)
    @window = window
    @icon = Gosu::Image.new(window, "images/pacman.png", true)
    @top = rand(window.height)
    @right = 10
  end

  def draw
    @icon.draw(@right, @top, 1)
  end

  def move_right
    @right = @right + 6

    if @right > @window.width
      self.reset
      @window.add_score
    end
  end

  def reset
    @right = 10
    @top = rand(@window.height)
  end

  def right
    @right
  end

  def top
    @top
  end
end