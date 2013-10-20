Note: these are instructions to follow for the instructor.

# 1. Setup

## Windows

- Install Ruby by running `installers/windows/rubyinstaller-1.9.3-p448.exe` 
- Install Sublime by running `installers/windows/Sublime Text 2.0.2 Setup.exe`
- From the command line: `gem install gosu`

## Mac

- Ruby is already installed! Yaay!
- Install Sublime by running `installers/mac/Sublime Text 2.0.2.dmg`
  - And drag Sublime into Applications
- From the terminal: `gem install gosu`

# 2. Let's Begin!

We're going to be reading and writing a lot of code. It may seem like a lot at first. You don't have to understand everything all at once, I know I never do. But we can play around with the code, we'll change it and see what happens. We'll learn by doing. So type along with me and we'll be fine.

- Open Sublime
- Drag the `code` folder into Sublime, this is the starting code we'll use to build upon.

The `code` folder has two files: `main.rb` and `window.rb`

**main.rb:**

```ruby
require 'rubygems'
require 'gosu'

require './window'

window = Window.new
window.show
```

This file will be used to run the program. It includes the other files we need.

Remember that computers really don't know much and we have to define things for it. This is what is happening here. We are telling the program to require libraries that already have definitions. And then we're telling it to require a definition we created. We'll take a look at that in a moment.

We are requiring the Gosu library, this is a library that makes it easier for us to make games in Ruby.

The last two lines are used to create a new window, and then we're sending the `show` message to the window, and this tells the window to show itself!

**window.rb**

```ruby
class Window < Gosu::Window
  def initialize
    super(300, 300, false)
    self.caption = "Adnan's Game!"
  end

  def update
  end

  def draw
  end
end
```

So this is how we define objects in Ruby. `Gosu::Window` is a prefined object from the Gosu library. We define object by using the term `class`. And inside the object we define methods. These are the messages we can send to the objects. The `show` method isn't defined here because the `Gosu::Window` library does that for us.

# 3. Let's run the code!

Click on the `main.rb` file
Click on the `Tools` menu and select `Build`

A window pops up! NEAT!

Let's close the window and play around with the code a little.

Click on the `window.rb` file. Let's change around the numbers here. Run the program.

Okay, let's settle on `500` and `500`.

Oh look, it says "Adnan's Game!", put in your own name here. Run the program.

It shows your name! How amazing is that? Let's get more amazing by adding images that we can control!

# 4. Creating the player.

Right click on the code folder, and select `New file`

Save the file and call it `player.rb`

To make sure our program knows about our new file and can use it, 
don't forget to add the line ```require './player'``` in `main.rb`

Now let's go back to `player.rb` and define the Player class with the most basic code:

```ruby
class Player
end
```

And then let's add some methods to it.

```ruby
class Player
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/ghost.png", true)
  end

  def draw
    @icon.draw(0, 0, 1)
  end
end
```

# 4. Let's add the player to the window.

Click on `window.rb`

Add the following line to the `initialize` method:

```ruby
def initialize
  super(500, 500, false)
  self.caption = "Adnan's Game!"
  @player = Player.new(self)
end
```

Remember that the initialize method needs a window, well, we're in the window, so we'll pass it self.

And then in the `draw` method:

```ruby
def draw
  @player.draw
end
```

Okay, let's see what happens when we run the program.

Whoa! The ghost is in our window!

Let's make the ghost start lower in the window.

For that we'll go to the `player.rb` file.

And we'll modify the co-ordinates:

```ruby
def draw
  @icon.draw(50, 100, 1)
end
```

Let's setting on 200 and 200. About the centre of the screen.

# 5. Using the keyboard to move the ghost.

So you know how we keep changing the co-ordinates to move the ghost? Wouldn't it be cool if we could use the keyboard to control the ghost!? Let's learn how to do that.

We will need to detect when the keyboard is pressed, and then we'll have to tell the player to move. But since the player doesn't know how to move, we'll have to define movement in the player class!

First, let's modify the code in the window class to detect the keyboard.

**window.rb**
```ruby
def update
  if button_down? Gosu::Button::KbLeft
    @player.move_left
  end
end
```

`button_down?` is a method that `Gosu::Window` gives us to we can see if which button is currently pressed down on the keyboard.

`Gosu::Button::KbLeft` is how we reference the left button. We don't
have to understand the whole line, but as we can see, it's used to
reference the left button.

We're using the if statement here, so we're telling our program, if the
left button is pressed down, then send the `move_left` message to the player. Makes sense.

But the player doesn't have a `move_left` method!

Let's write it!

**player.rb**
```ruby
class Player
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/ghost.png", true)
    @left = 200
  end

  def draw
    @icon.draw(@left, 200, 1)
  end

  def move_left
    @left = @left - 3
  end
end
```

Let's define a `@left` variable and let's start it at 200.

Now in our `move_left` method, we'll just subtract 3 from `@left`. Since
the closer we get to 0 the more we move left.

Okay, let's run our program and see what happens.

Right on!

Let's detect the left key and make our ghost go left.

**window.rb**
```ruby
def update
  if button_down? Gosu::Button::KbLeft
    @player.move_left
  end

  if button_down? Gosu::Button::KbRight
    @player.move_right 
  end
end
```

**player.rb**
```ruby
  def move_right
    @left = @left + 3
  end
```

We're going to add 3 to the `@left` in order to move right.

Let's do the same thing for up and down!

**window.rb**
```ruby
def update
  if button_down? Gosu::Button::KbLeft
    @player.move_left
  end

  if button_down? Gosu::Button::KbRight
    @player.move_right
  end

  if button_down? Gosu::Button::KbUp
    @player.move_up
  end

  if button_down? Gosu::Button::KbDown
    @player.move_down
  end
end
```

**player.rb**
```ruby
  def move_up
    @top = @top - 3
  end

  def move_down
    @top = @top + 3
  end
```

Note that we will have to define a `@top` variable.

**player.rb**
```ruby
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/ghost.png", true)
    @left = 200
    @top = 200
  end

  def draw
    @icon.draw(@left, @top, 1)
  end
```

Don't worry if we get the plusses and the minusses mixed up, we can change and try again.

Let's run the program now...

WHOA! You can even move diagonally by pressing right and up at the same time!

# 6. Let's add pacman!

Our program doesn't know what pacman is, so we'll have to define pacman!

Let's start by right clicking on the code directory, add a new file.

Save it and call it `pacman.rb`

**pacman.rb**
```ruby
class Pacman
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/pacman.png", true)
  end

  def draw
    @icon.draw(10, 10, 1)
  end
end
```

Let's get our window to draw the pacman.

**window.rb**

Up top:
```ruby
require './pacman'
```

```ruby
  def initialize
    super(500, 500, false)
    self.caption = "Adnan's Game!"
    @player = Player.new(self)
    @pacman = Pacman.new(self)
  end

  def draw
    @player.draw
    @pacman.draw
  end
```

Okay, so now let's run our program...

Cool, we have pacman.

# 7. Making pacman move.

Since pacman is controlled by the computer, we don't need keyboard input to make it move.

Let's start by making it start in a random position each time we start the game.

**pacman.rb**
```ruby
class Pacman
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/pacman.png", true)
    @top = rand(window.height)
  end

  def draw
    @icon.draw(10, @top, 1)
  end
end
```

Now let's make it move to the right automatically.

We'll have to do that in the window code

**window.rb**
```ruby
  def update
    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end

    if button_down? Gosu::Button::KbRight
      @player.move_right
    end

    if button_down? Gosu::Button::KbDown
      @player.move_down
    end

    if button_down? Gosu::Button::KbUp
      @player.move_up
    end

    @pacman.move_right
  end
```

We don't have to check for the keyboard now. We just want to move pacman to the right everytime update is called.

Let's define `move_right` for pacman. Just like we did for our ghost a while ago.

**pacman.rb**
```ruby
class Pacman
  def initialize(window)
    @icon = Gosu::Image.new(window, "images/pacman.png", true)
    @top = rand(window.height)
    @left = 10
  end

  def draw
    @icon.draw(@left, @top, 1)
  end

  def move_right
    @left = @left + 3
  end
end
```

# 8. There goes pacman!

Let's make it comeback...

Everytime it gets to the end of the screen, let's make pacman start at the beginning.

**pacman.rb**
```ruby
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
    @left = @left + 3

    if @left > @window.width
      self.reset
    end
  end

  def reset
    @left = 10
  end
end
```

Okay, so we're doing a few things here.

We're adding a reset method. This will reset the right position to 10.

And we're calling reset when the pacman's right position goes over the width of the window. And note that for this, we're storing the window variable in a `@window` variable so that we can use it in our other methods.

Let's run the program.

That's interesting, pacman is starting at the same position everytime. Let's randomize it when we reset!

**pacman.rb**
```ruby
  def reset
    @left = 10
    @top = rand(window.height)
  end
```

Okay, cool. But nothing happens when pacman gets to the ghost.

# 9. Catching the ghost.

We need to find out when pacman "eats" the ghost.

Let's write the code we want in `window.rb` `update` method:

```ruby
  if @player.eaten_by?(@pacman)
    @stop_game = true
  end
```

We don't have a `eaten_by?` method, so let's write that.

**player.rb**
```ruby
  def eaten_by?(pacman)
    Gosu::distance(@left, @top, pacman.left, pacman.top) < 50
  end
```

Gosu gives us a method we can use to find the distance between two different co-ordinates. We're going to give it the co-ordinates of our ghost and also the co-ordinates of our pacman. And we're going to say if the distance is less than 50 then pacman's eaten the ghost.

But we're not really doing anything when we set the `@stop_game` variable to true. So let's fix that.

If the `@stop_game` variable is set, we need to exit the `update` method and not change anything.

**window.rb**
```ruby
  def update

    if @stop_game == true
      return
    end

    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end

    if button_down? Gosu::Button::KbRight
      @player.move_right
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
```



Let's run the program. Oh no! We need to define more methods.

**pacman.rb**
```ruby
  def left
    @left
  end

  def top
    @top
  end
```

These allow player to access pacman's co-ordinates.

# 10. Let's unstuck the game.

It would be nice if we could press a key to restart the game without having to close and run the game again.

Let's use the escape key for that.

**window.rb**
```ruby
  def update
    if button_down? Gosu::Button::KbEscape
      @stop_game = false
      @pacman.reset
    end

    if @stop_game == true
      return
    end

    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end

    if button_down? Gosu::Button::KbRight
      @player.move_right
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
```

We'll set the `@stop_game` variable to false, so that we don't return from the `update` method. And we'll also reset the pacman so that it starts from the beginning.

# 11. Scoring the game

Let's display the score on the window. Let's say the score goes up each time pacman crosses the screen. If you dodge pacman, you get a point. We'll need a variable to store the score. Let's start there.

**window.rb**
```ruby
  def initialize
    super(500, 500, false)
    self.caption = "Adnan's Game!"
    @player = Player.new(self)
    @pacman = Pacman.new(self)
    @score = 0
  end
``` 

We want to add to the score when pacman passes the screen.

**pacman.rb**
```ruby
  def move_right
    @left = @left + 3

    if @left > @window.width
      self.reset
      @window.add_score
    end
  end
```

We don't have a way to access the score variable in the window object from the pacman object. So let's send a message back `add_score`.

**window.rb**
```ruby
  def add_score
    @score = @score + 1
  end
```

Okay now we need to show the score. We'll need to use a font to draw the text.

**window.rb**
```ruby
  def initialize
    super(500, 500, false)
    self.caption = "Adnan's Game!"
    @player = Player.new(self)
    @pacman = Pacman.new(self)
    @score = 0
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def draw
    @player.draw
    @pacman.draw
    @font.draw("Score: " + @score.to_s, 10, 10, 3)
  end
```

Oh, one more thing. We'll need to reset the score when we press escape.

**window.rb**
```ruby
  def update
    if button_down? Gosu::Button::KbEscape
      @score = 0
      @stop_game = false
      @pacman.reset
    end
```
