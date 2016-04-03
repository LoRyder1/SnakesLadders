require File.dirname(__FILE__) + '/Player'
require File.dirname(__FILE__) + '/Space'

class SnakesLadders
    # declare instance variables
    @players
    @spaces
    @is_finished

    # initialize game
    def initialize number_of_players, number_of_spaces = 100, number_of_ladders = 5, number_of_snakes = 5
        @players     = []
        @spaces      = []
        @is_finished = false
        @current_roll = 0
        @current_space = 0
        @current_player = nil

        # private helper method to initialize the creation of players
        init_players(number_of_players, number_of_spaces)
        # private helper method to initialize the creation of spaces
        init_spaces(number_of_spaces, number_of_ladders, number_of_snakes)
        @spaces.each_with_index do |x, index|
          if x.type == 'snake' || x.type == 'ladder'
            puts "#{index}, #{x.type}"
          end
        end
    end

    def run
        while !@is_finished
            @players.each do |player|
                puts "Enter #{player.name}'s Roll: "
                @current_player = player

                validate_roll

                # the roll is valid! move the player
                player.move(@current_roll)

                # set instance var of the Space the player landed on
                @current_space = @spaces[player.position - 1]

                interpret_space

                report_player_stats

                # check to see if the player has won the game
                if (player.position == @spaces.length)
                    puts (<<-WIN)
                        #{player.name} Wins!
                    
                    WIN
                    @is_finished = true
                    break
                end
            end
        end

        # end the game
        puts (<<-END)
            Game Over!

        END
        exit
    end

    def interpret_space
        # check to see if the space is a ladder or a snake, and act accordingly
        if (@current_space.type == 'ladder')
            output_snakeladder_msg('ladder', 'forward')
            @current_player.move(@current_space.spaces_to_move)
        elsif (@current_space.type == 'snake')
            output_snakeladder_msg('snake', 'back')
            @current_player.move(@current_space.spaces_to_move)
        end      
    end

    def validate_roll
        # get player roll
        @current_roll = gets.chomp.to_i

        while (@current_roll < 1 || @current_roll > 99)
            puts "Invalid Roll! Please try that again:"
            @current_roll = gets.chomp.to_i
        end
    end

    def output_snakeladder_msg item, direction
        puts (<<-SNAKELADDER)
              You landed on a #{item}! You get to move #{direction} #{@current_space.spaces_to_move} spaces!

        SNAKELADDER
    end

    def report_player_stats
      # Use heredoc for multiline strings
        @players.each do |pl|
          puts (<<-MSG)
            Stats:

              Player:   #{pl.name}
              Position: #{pl.position}

          MSG
        end
    end

    # all methods following this declaration are private
    private

    # helper method to return a random Space object in our list
    def get_random_space min, max, must_be_normal = true
        # the index of the random space
        si = rand(min..max)

        # check whether or not the space needs to be 'normal'
        if must_be_normal
            # if so, make sure the selected Space is 'normal'
            while (@spaces[si].type != 'normal')
                si = rand(min..max)
            end
        end

        # explicity return the selected Space object
        return @spaces[si]
    end

    # helper method to initialize the players list (for use in the constructor)
    def init_players number_of_players, max_position
        number_of_players.times do |i|
            puts "Player #{i + 1} Name: "

            # stores the new Player object in our players list
            @players << Player.new(gets.chomp, max_position)
        end
    end

    # helper method to initialize the spaces list (for use in the constructor)
    def init_spaces number_of_spaces, number_of_ladders, number_of_snakes
        # create game spaces
        number_of_spaces.times do
            # stores each new Space object in our spaces list
            @spaces << Space.new()
        end

        # create game ladders
        number_of_ladders.times do
            # get a random space
            space = get_random_space(10, number_of_spaces - 10)

            # transform the selected Space into a ladder
            space.transform('ladder')
        end

        # create game snakes
        number_of_snakes.times do
            # get a random space
            space = get_random_space(10, number_of_spaces - 10)

            # transform the selected Space into a snake
            space.transform('snake')
        end
    end
end
