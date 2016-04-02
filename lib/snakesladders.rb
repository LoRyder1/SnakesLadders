require File.dirname(__FILE__) + '/user'

class SnakesLadders
  def initialize num_players
    @num_players = num_players
    @players = []
    @spaces = []
    @finished? = false
    
    create_players
    create_spaces
  end

  def roll

  end

  def run
    while !self.finished?
      @players.each do |p|
        puts "Player #{p.name} enter roll"
        roll = gets.chomp.to_i

      end
    end
  end

  private
  def create_players
    @num_players.times do |x|
      puts "Player #{x+1} Enter Name:"
      player = User.new(gets.chomp)
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

          @spaces[space_index].type = 'snake'

          while (@spaces[space_index].type != 'normal')
              space_index = get_random_space
          end

          @spaces[space_index].type = 'ladder'
      end
  end

  def get_random_space
      (10..90).rand
  end
end
