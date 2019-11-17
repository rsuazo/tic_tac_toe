class Players

  attr_accessor :name, :symbol
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
  
  
  def choice(player)

    spot_list = ["1: Top-Left", "2: Top-Center", "3: Top-Right", "3: Center-Left", "4: Center", "5: Center-Right", "6: Bottom-Left", "7: Bottom-Center", "8: Bottom-Right"]

    puts "#{player.name}, please select a spot: (1-9)"
    9.times {|i| puts spot_list[i]}
    player_input = gets.chomp

    if player_input =~ /^-?[0-9]+$/
      puts "Valid input"
    else
      puts "Invalid input."
    end

    player_input

  end
  
  
    def winner(player)
    end
  
end
  


class Game
  attr_accessor :game_num, :turn
  @@games_played = 0
  
  def games_played
    puts "Games Played: #{@@games_played}"
  end
  
  
  def initialize(game_num = 1,turn =  1)
    @game_num = game_num
    @turn = turn
    puts "Game #{@game_num}"
    @@games_played +=1
  end
  
  def show_board
  end
  
    
  def loop
    true  
  end
  
  
  def win
  end
  
  def start
  end

  
  def over(winner)
    
    puts "Game Over!  #{player_winner} won!  Thanks for playing!"
    false

  end
    
end


  
class GameSpot
    spot = {}
  
    attr_accessor :number, :state, :symbol
  
    def initialize(number,state=false,symbol=nil)
          
      @number = number
      @state = state
      @symbol = symbol
    
    end
  if 1&&2&&3 || 4&&5&&6 || 7&&8&&9
  elsif 1&&4&&7 etc.

    multi-dimensional array.

    array = [["x", "o", "x"],
             ["x", "o", "x"],
             ["x", "o", "x"]]
end


  
  
game = Game.new

spot_1 = GameSpot.new(1)
spot_2 = GameSpot.new(2)
spot_3 = GameSpot.new(3)
spot_4 = GameSpot.new(4)
spot_5 = GameSpot.new(5)
spot_6 = GameSpot.new(6)
spot_7 = GameSpot.new(7)
spot_8 = GameSpot.new(8)
spot_9 = GameSpot.new(9)

puts "What is player 1's name?:"
name = gets.chomp.capitalize
player1 = Player.new(name, "X's")

puts "What is player 2's name?:"
name = gets.chomp.capitalize
player2 = Player.new(name, "O's")


puts "#{player1.name}(#{player1.symbol}) & #{player2.name}(#{player2.symbol}) have joined the arena!"


game.start

while !game.over
  while game.loop
    choice = player1.choice
    game.show_board
    game.win
    player2.choice
    game.show_board
    game.win
  end
end
   
  
  