class TicTacToe
    attr_accessor :board, :input

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(str)
        @input = str.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken? (input)
        @board[input] == " " ? false : true
    end

    def valid_move? (input)
       !position_taken?(input) && input.between?(0, 8)
    end

    def turn_count 
        9 - @board.count(" ")
        # @board.count {|a| a != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn 
        puts "Please enter a number (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index) 
            token = current_player
            move(index, token)

        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
              return combo
            end
        end
    end

    def full? 
        turn_count == 9 ? true : false
    end

    def draw?
        !won? && full? 
    end

    def over?
        won? || draw?
    end

    def winner
        if winner = won? 
            @board[winner[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end
