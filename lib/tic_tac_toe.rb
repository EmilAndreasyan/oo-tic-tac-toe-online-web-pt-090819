require 'pry'
class TicTacToe
attr_accessor :board

def initialize
    @board = Array.new(9, " ") # creates an array of 9 items and sets it to "" empty string
end

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
]

def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[2]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
end

def input_to_index(input)
input.to_i - 1 # converts to integer and corresponds to exact location, array # is 0 based
end

def move(index, token = "X")
    @board[index.to_i] = token #to_i in case index inserted as string
end

def position_taken?(index)
    @board[index] != " "
end

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
    #index.between?(0,8) && @board[index] == " "
end

def turn
    puts "Choose a number between 1 - 9"
    index = input_to_index(gets.chomp)
    if valid_move?(index)
    move(index, current_player)
    display_board
    else
    turn
    end
end

def turn_count
    count = 0
    @board.each do |el|
    #   if el == "X" || el == "O"
    #     counter += 1 
    #   end
    count += 1 if el != " "
    end
    count
  end

 def current_player
    turn_count % 2 == 0 ? "X" : "O"
    # turn_count.even? ? "X" : "O"
 end

 def won?
    winner = nil
    WIN_COMBINATIONS.each do |arr|
    if arr.all? {|win| @board[win] == "X" || @board[win] == "O"}
    winner = arr
    end
    winner
    end
 end

 def full?
    turn_count == 9
 end

 def draw?
    full? && !won?
    # if full? && !won?
    # true
    # elsif won?
    # false
    # elsif !full? && !won?
    # false
    # end
 end

 def over?
    won? || draw?
 end

 def winner
    if player = won?
    @board[player[0]]
    end
 end

 def play
    turn until over?
    if winner
    puts "Congratulations #{winner}"
    else
    puts "Cat's Game!"
    end
 end

end

game = TicTacToe.new
TicTacToe::WIN_COMBINATIONS
game.display_board
game.input_to_index("2")
game.move("3", "O")
game.position_taken?(5)
game.valid_move?(8)
game.turn
game.turn_count
game.current_player
game.won?
game.draw?
<<<<<<< HEAD
game.winner
game.play
=======
game.winner
>>>>>>> 214f8111aff522d57621bcb19f0e4467c68ff119
