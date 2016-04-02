require File.dirname(__FILE__) + '/Player'
require File.dirname(__FILE__) + '/Space'

class SnakesLadders
    @num_players
    @players
    @spaces
    @is_finished

    # initialize game
    def initialize num_players
        @num_players = num_players
        @players     = []
        @spaces      = []
        @is_finished = false

        create_players
        create_spaces
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

    private
    def create_players
        @num_players.times do |x|
            puts "Player #{x+1} Enter Name:"
            player = Player.new(gets.chomp)
            @players << player
        end
    end

    def create_spaces
        num_of_snakes = 0;
        num_of_ladders = 0;

        for i in 1..100
            @spaces << Space.new
        end

        (1..5).each do |i|
            space_index = get_random_space

            while (@spaces[space_index].type != 'normal')
                space_index = get_random_space
            end

            @spaces[space_index].setType('snake')
            puts "Snake: #{space_index + 1}"

            while (@spaces[space_index].type != 'normal')
                space_index = get_random_space
            end

            @spaces[space_index].setType('ladder')
            puts "Ladder: #{space_index + 1}"
        end
    end

    def get_random_space
        rand(10..90)
    end
end
