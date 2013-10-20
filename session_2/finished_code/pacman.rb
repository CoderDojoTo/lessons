class Pacman
  def initialize(window)
    @window = window
    @icon = Gosu::Image.new(window, "images/pacman.png", true)
    @top = rand(window.height)
    @left = 10
  end

  def draw
    @icon.draw(@left, @top, 1)
  end

  def move_right
    @left = @left + 12

    if @left > @window.width
      self.reset
      @window.add_score
    end
  end

  def reset
    @left = 10
    @top = rand(@window.height)
  end

  def left
    @left
  end

  def top
    @top
  end
end
