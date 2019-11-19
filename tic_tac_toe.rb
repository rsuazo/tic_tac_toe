class Players

  attr_accessor :name, :symbol
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
  
  

  def choice

    valid_input = true

    while valid_input

      puts "#{@name}, please select a spot: (1-9)\n\n"
      puts " 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n"
      
      player_input = gets.chomp

      if player_input =~ /^-?[1-9]+$/
        puts "Great choice!\n"
        break
      else
        puts "Invalid input. Try again!\n\n"
      end

    end

    player_input.to_i

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
  
  
    
  def loop
    true  
  end

  def over
    
    puts "Game Over!  #{player_winner} won!  Thanks for playing!"
    false

  end
    
end

class Boards
  attr_accessor :board

  def initialize(board = [])
    @board = [Spot.new, Spot.new, Spot.new, Spot.new, Spot.new, Spot.new, Spot.new, Spot.new, Spot.new]
    
  end

  def show
    puts "\n#{@board[0].symbol}|#{@board[1].symbol}|#{@board[2].symbol}\n#{@board[3].symbol}|#{@board[4].symbol}|#{@board[5].symbol}\n#{@board[6].symbol}|#{@board[7].symbol}|#{@board[8].symbol}\n\n"
  end


  def win(choice)
    if ((@board[0].state == true) && (@board[1].state == true) && (@board[2].state == true)) && ((@board[0].symbol == choice) && (@board[1].symbol == choice) && (@board[2].symbol == choice))
        puts "you won!!!!"
        exit!
    elsif ((@board[3].state == true) && (@board[4].state == true) && (@board[5].state == true)) && ((@board[3].symbol == choice) && (@board[4].symbol == choice) && (@board[5].symbol == choice))
        puts "you won!!!!"
        exit!
    elsif ((@board[6].state == true) && (@board[7].state == true) && (@board[8].state == true)) && ((@board[6].symbol == choice) && (@board[7].symbol == choice) && (@board[8].symbol == choice))
          puts "you won!!!!"
          exit!
    elsif ((@board[0].state == true) && (@board[3].state == true) && (@board[6].state == true)) && ( (@board[0].symbol == choice) && (@board[3].symbol == choice) && (@board[6].symbol == choice))
        puts "you won!!!!"
        exit!
      
    elsif ((@board[1].state == true) && (@board[4].state == true) && (@board[7].state == true)) && ((@board[1].symbol == choice) && (@board[4].symbol == choice) && (@board[7].symbol == choice))
        puts "you won!!!!"
        exit!
    elsif ((@board[2].state == true) && (@board[5].state == true) && (@board[8].state == true)) && ((@board[2].symbol == choice) && (@board[5].symbol == choice) && (@board[8].symbol == choice))
        puts "you won!!!!"
        exit!
    elsif ((@board[0].state == true) && (@board[4].state == true) && (@board[8].state == true)) && ((@board[0].symbol == choice) && (@board[4].symbol == choice) && (@board[8].symbol == choice))
        puts "you won!!!!"
        exit!
    elsif ((@board[2].state == true) && (@board[4].state == true) && (@board[6].state == true)) && ((@board[2].symbol == choice) && (@board[4].symbol == choice) && (@board[6].symbol == choice))
        puts "you won!!!!"
        exit!
    end
  end
end


class Spot
    
  attr_accessor :state, :symbol
  
    def initialize(state=false,symbol=" ")
    
      @state = state
      @symbol = symbol
    
    end

end


game = Game.new

game_board = Boards.new


puts "What is player 1's name?:\n"
name = gets.chomp.capitalize
player1 = Players.new(name, "X")

puts "What is player 2's name?:\n"
name = gets.chomp.capitalize
player2 = Players.new(name, "O")


puts "#{player1.name}(#{player1.symbol}) & #{player2.name}(#{player2.symbol}) have joined the arena!\n\n"


while game.loop

current_player = player1

player_choice = current_player.choice - 1
  while game_board.board[player_choice].state
    puts "\nThat spot is already taken!  Try again\n\n"
    player_choice = current_player.choice - 1
  end

game_board.board[player_choice].symbol = current_player.symbol
game_board.board[player_choice].state = true

game_board.show

game_board.win(game_board.board[player_choice].symbol)


current_player = player2

player_choice = current_player.choice - 1
  while game_board.board[player_choice].state
    puts "\nThat spot is already taken!  Try again!\n\n"
    player_choice = current_player.choice - 1
  end

game_board.board[player_choice].symbol = current_player.symbol
game_board.board[player_choice].state = true

game_board.show
game_board.win(game_board.board[player_choice].symbol)


end

# while !game.over
#   while game.loop
#     choice = player1.choice
#     game.show_board
#     game.win
#     player2.choice
#     game.show_board
#     game.win
#   end
# end