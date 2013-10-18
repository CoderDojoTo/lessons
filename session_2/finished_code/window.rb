require './player'
require './pacman'

class Window < Gosu::Window
  def initialize
    super(500, 500, false)
    self.caption = "Adnan's Game!"
    @player = Player.new(self)
    @pacman = Pacman.new(self)
  end

  def update
    if button_down? Gosu::Button::KbRight
      @player.move_right
    end

    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end

    if button_down? Gosu::Button::KbDown
      @player.move_down
    end

    if button_down? Gosu::Button::KbUp
      @player.move_up
    end

    @pacman.move_right
  end

  def draw
  	@player.draw
    @pacman.draw
  end
end