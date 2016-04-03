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

        # private helper method to initialize the creation of players
        init_players(number_of_players)
        # private helper method to initialize the creation of spaces
        init_spaces(number_of_spaces, number_of_ladders, number_of_snakes)
    end

    def run
        while !@is_finished
            @players.each do |p|
                puts "Player #{p.name} enter roll"
                roll = gets.chomp.to_i

                while (roll < 1 || roll > 6)
                    puts "Invalid roll! Try again."
                    roll = gets.chomp.to_i
                end

                p.move(roll)

                puts "Roll: #{roll}"
                puts "Space Type: #{@spaces[p.position - 1].type}"
                puts "Spaces to Move: #{@spaces[p.position - 1].spaces_to_move}"

                if (@spaces[p.position - 1].type == 'snake')
                    p.move_back(@spaces[p.position - 1].spaces_to_move)
                elsif (@spaces[p.position - 1].type == 'ladder')
                    p.move(@spaces[p.position - 1].spaces_to_move)
                end

                puts "Stats: "

                @players.each do |pl|
                    puts "#{pl.name}: #{pl.position}"
                end

                if (p.position == 100)
                    puts "#{p.name} wins!"
                    @is_finished = true

                    break
                end
            end
        end

        puts "Game over!"
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
    def init_players number_of_players
        number_of_players.times do |i|
            puts "Player #{i + 1} Name: "

            # stores the new Player object in our players list
            @players << Player.new(gets.chomp)
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
