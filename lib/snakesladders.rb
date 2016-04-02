require File.dirname(__FILE__) + '/user'

class SnakesLadders
  def initialize num_players
    @num_players = num_players
    @players = []
    num_players.times do |x|
      @players << User.new
    end
    
  end

  def method_name
    
  end
end
