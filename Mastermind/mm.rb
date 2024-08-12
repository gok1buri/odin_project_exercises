class Game
    attr_accessor :colours, :secret_code, :turn_number, :user_guess

    def initialize
        @colours = ["A","B","C","D","E","F","G","H"]
        generate_code
        @turn_number = 1
        @user_guess = []
        puts "Guess a 4 pegs long code of colours in 12 turns. Each peg is a different colour. 
        After each guess you will learn how many pegs in your guess are correctly place and correct colour, but in a wrong place."
    end

    def generate_code
        @secret_code = @colours.shuffle.pop(4)
    end

    def input_a_move
        puts "What is your guess? Available colours: #{@colours}"
        user_guess = gets.chomp()
        @user_guess = user_guess.split("")
        verify_move
        puts "This is your guess number #{@turn_number} : #{@user_guess}"
    end 

    def move_correct?
            @user_guess.length == 4 &&
            @user_guess.all? do |value|
            @colours.include?(value)
            end
    end    

    def verify_move
        if  move_correct?
            return
        else 
            puts "Incorrect move. Put in 4 of the available colours: #{@colours}"
            @user_guess = gets.chomp()
            verify_move
        end
    end

    def compare_codes
        well_placed = 0
        wrongly_placed = 0
    
            @user_guess.each_with_index do |value,index|
                if @user_guess[index] == @secret_code[index]
                        well_placed += 1
                    next
                else
                    @secret_code.each do |secret_value,secret_index|
                        if value == secret_value
                            wrongly_placed += 1
                        else
                            next
                        end
                    end
                end
            end
        puts "#{well_placed} colours in a correct place and #{wrongly_placed} colours in a wrong place"
        well_placed = 0
        wrongly_placed = 0
    end

    def play
        if @turn_number < 13 && @user_guess === @secret_code
            puts "You guessed the code!"
            puts "Game over"
                return
        elsif @turn_number < 13
            puts "It's turn ##{@turn_number}"
            input_a_move
            @turn_number +=1
            compare_codes
            play
        else 
            puts "You ran out of turns!"
            puts "Game over"
            return
        end
        
    end
end

game1 = Game.new
game1.play