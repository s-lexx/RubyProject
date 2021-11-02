#require 'pry'
require_relative 'Game.rb'
require_relative 'ResultPrinter.rb'
require_relative 'Word_Reader.rb'

if Gem.win_platform? # Блок кода для устранения проблемы c кириллицей на платформе Windows

  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
  io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

reader = WordReader.new # создание обьектов клссов 
printer = ResultPrinter.new 
current_path = File.dirname(__FILE__)
word = reader.read_from_file(current_path + "/data/words.txt") # выбор слова для игры
game = Game.new(word)

while game.status == 0 #основной цикл 

  printer.print_status(game)
  game.ask_next_letter
	
end

printer.print_status(game) # вывод результата