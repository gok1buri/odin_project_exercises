module Playable
    @@possible_moves = [0,1,2,3,4,5,6,7,8]
    @@board = 
    ["_","_","_",
    "_","_","_",
    "_","_","_"]
    @@end_of_game = false

    def input_a_move
        puts "Put in your move. Available moves: #{@@possible_moves}"
        @current_move = gets.chomp().to_i
    end

    def display_board
        puts "THE BOARD"
        puts @@board[0..2].join(" ")
        puts @@board[3..5].join(" ")
        puts @@board[6..8].join(" ")
    end

    def is_move_correct
            if @@possible_moves.include?(@current_move)
                record_move
            else 
                puts "You can't make this move. Available moves: #{@@possible_moves}"
                current_move = gets.chomp()
            end
    end

    def record_move
        @@board[@current_move] = @player_symbol
        @@possible_moves.delete(@current_move)
    end

    def win?
            if @@possible_moves.empty?
                @@end_of_game = true
                puts "It's a tie!"
            #different winning conditions

            #horizontal
            elsif @@board[0..2].all?("#{@player_symbol}")
                @@end_of_game = true
            elsif @@board[3..5].all?("#{@player_symbol}")
                @@end_of_game = true
            elsif @@board[6..8].all?("#{@player_symbol}")
                @@end_of_game = true

            #vertical
            elsif @@board[0] === ("#{@player_symbol}") && @@board[3] === ("#{@player_symbol}") && @@board[6] === ("#{@player_symbol}")
                @@end_of_game = true
            elsif @@board[1] === ("#{@player_symbol}") && @@board[4] === ("#{@player_symbol}") && @@board[7] === ("#{@player_symbol}")
                @@end_of_game = true
            elsif @@board[2] === ("#{@player_symbol}") && @@board[5] === ("#{@player_symbol}") && @@board[8] === ("#{@player_symbol}")
                @@end_of_game = true

            #crossed
            elsif @@board[0] === ("#{@player_symbol}") && @@board[4] === ("#{@player_symbol}") && @@board[8] === ("#{@player_symbol}")
                @@end_of_game = true
            elsif @@board[2] === ("#{@player_symbol}") && @@board[4] === ("#{@player_symbol}") && @@board[6] === ("#{@player_symbol}")
                @@end_of_game = true
            else
                @@end_of_game = false
            end
        if @@end_of_game == true
            puts "Game Over!"
        else
            return
        end
    end
end

class Player
include Playable
attr_accessor :name, :player_symbol
    def initialize(name,player_symbol)
        @player_symbol = player_symbol
        @name = name
    end
    
    def player_turn
        input_a_move
        is_move_correct
        record_move 
        display_board
        win?
    end
end


class Game < Player
include Playable

    def initialize
        @player_one = Player.new("one","X")
        @player_two = Player.new("two","O")
    end

    def the_game
        if @@end_of_game
            return
        else
        @player_one.player_turn
            if @@end_of_game
                return
            end
        @player_two.player_turn
        end
    the_game
    end
end