class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" or @board[index] == "O"
      return true
    else
      return false
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) and !position_taken?(index)
        return true
    end
    nil
  end
  
  def turn_count
    count = 0
    @board.each do | player |
      if player == "X" or player == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    if (turn_count + 1) % 2 == 0
      return "O"
    else
      return "X"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do | slot |
        if (@board[slot[0]] == "X" and
            @board[slot[1]] == "X" and 
            @board[slot[2]] == "X")
          return slot
        elsif (@board[slot[0]] == "O" and 
              @board[slot[1]] == "O" and 
              @board[slot[2]] == "O")
          return slot
        end
    end
    nil
  end
  
  def full?
    @board.each do | spot |
      if spot == " "
        return false
      end
    end
    true
  end
  
  def draw?
    if full? and !won?
      return true
    end
    false
  end
  
  def over?
    if won? || full?
      return true
    end
    false
  end
  
  def winner
    if won?
      return current_player == "X" ? "O" : "X"
    end
    nil
  end
  
  def turn
    puts "Which spot do you want to play?"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      until valid_move?(index) do
        puts "Sorry, that spot isn't valid, try again: "
        input = gets.chomp
        index = input_to_index(input)
      end
      move(index, current_player)
      display_board
    end
  end
  
   def play
     until over? do
       turn
     end
       
     if won?
        puts "Congratulations " + winner + ", You won!!"
     elsif draw?
        puts "Sorry, it ended in a draw."
     end
   end  
end