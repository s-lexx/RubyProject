require_relative 'methods'
if (Gem.win_platform?) # Блок кода для устранения проблемы c кириллицей на платформе Windows
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
   io.set_encoding(Encoding.default_external, Encoding.default_internal)
   end
end

errors = 0 # начальная инициализация переменных
good_letters = []
bad_letters = []
cls
letters = get_letters

while errors < 7 do  #основной блок 
  print_status(letters, good_letters, bad_letters, errors)
  puts "Введите следующую букву" 
  user_input = get_user_input
  result = check_result(user_input, letters, good_letters, bad_letters)
  if (result == -1)
  	errors += 1
  elsif (result == 1)
    break		
  end
end

print_status(letters, good_letters, bad_letters, errors) # вывод результата игры
 