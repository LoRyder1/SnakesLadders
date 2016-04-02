require File.dirname(__FILE__) + '/Player'
require File.dirname(__FILE__) + '/Space'

class SnakesLadders
    @players
    @spaces
    @is_finished

    # initialize game
    def initialize number_of_players
        @players     = []
        @spaces      = []
        @is_finished = false

        # private helper method to initialize the creation of players
        init_players(number_of_players)
        # private helper method to initialize the creation of spaces
        init_spaces
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
    def get_random_space
        rand(10..90)
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
    def init_spaces
        # create the 100 game spaces
        100.times do
            # stores each new Space object in our spaces list
            @spaces << Space.new()
        end

        # create the 5 random snakes and 5 random ladders
        5.times do
            # the index of the Space to transform into a snake
            si = get_random_space

            # make sure the selected Space is a 'normal' type
            while (@spaces[si].type != 'normal')
                # if so, select a new Space to transform
                si = get_random_space
            end

            # transform the selected Space into a snake
            @spaces[si].transform('snake')

            # the index of the Space to transform into a ladder
            si = get_random_space

            # make sure the selected Space is a 'normal' type
            while (@spaces[si].type != 'normal')
                # if so, select a new Space to transform
                si = get_random_space
            end

            # transform the selected Space into a ladder
            @spaces[si].transform('ladder')
        end
    end
end
