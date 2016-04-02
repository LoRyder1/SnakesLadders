require File.dirname(__FILE__) + '/lib/snakesladders'

puts "Hello Welcome to the Snakes and Ladders Game"

puts "How many players?(1-4)"

num_players = gets.chomp.to_i

game = SnakesLadders.new(num_players)
