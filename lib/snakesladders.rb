require File.dirname(__FILE__) + '/user'

class SnakesLadders
  def initialize num_players
    @num_players = num_players
    @players = []
    @finished? = false
    create_players
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
end
