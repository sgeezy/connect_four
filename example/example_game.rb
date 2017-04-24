# root = File.expand_path("../", File.dirname(__FILE__))
# require "#{root}/lib/connect_four.rb"

require_relative "../lib/connect_four.rb"

puts "Welcome to Connect Four"
brad = ConnectFour::Player.new({color: "B", name: "brad"})
reggie = ConnectFour::Player.new({color: "R", name: "reggie"})
players = [brad, reggie]
ConnectFour::Game.new(players).play