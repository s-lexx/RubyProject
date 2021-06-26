require 'pry'
require_relative 'Game'
require_relative 'ResultPrinter'

if Gem.win_platform? # Блок кода для устранения проблемы c кириллицей на платформе Windows

  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
  io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

printer = ResultPrinter.new # создание обьектов клссов и передача загаданного слова
word = ARGV[0]
game = Game.new(word)

while game.status == 0 #основной цикл 

  printer.print_status(game)
  game.ask_next_letter
	
end

printer.print_status(game) # вывод результата