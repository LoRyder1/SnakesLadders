require File.dirname(__FILE__) + '/lib/SnakesLadders'

puts "Hello! Welcome to the wonderful game of Snakes and Ladders!"
puts "How many players will there be?"

game = SnakesLadders.new(gets.chomp.to_i)
game.run()
