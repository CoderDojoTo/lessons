require './player'
require './pacman'

class Window < Gosu::Window
  def initialize
    super(500, 500, false)
    self.caption = "Adnan's Game!"
    @player = Player.new(self)
    @pacman = Pacman.new(self)
    @score = 0
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    if button_down? Gosu::Button::KbEscape
      @score = 0
      @stop_game = false
      @pacman.reset
    end

    if @stop_game == true
      return
    end

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

    if @player.eaten_by?(@pacman)
      @stop_game = true
    end
  end

  def draw
  	@player.draw
    @pacman.draw
    @font.draw("Score: " + @score.to_s, 10, 10, 3)
  end

  def add_score
    @score = @score + 1
  end
end