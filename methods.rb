def get_letters # проверка и получение слова от пользователя
  words = ARGV[0]
  abort "Вы не загадали слово для игры" if (words == nil) || (words == "")
  words.encode('UTF-8').split('')
end

def get_user_input # пользователь угадывает букву
  letter = ''

  while letter == '' do
    letter = STDIN.gets.encode('UTF-8').chomp
  end

  letter
end

def check_result(user_input, letters, good_letters, bad_letters) # проверка результата хода игрока
  return 0 if good_letters.include?(user_input) || bad_letters.include?(user_input)
  
  if letters.include?(user_input)
    good_letters << user_input

    letters.uniq.size == good_letters.size ? 1 : 0
  else
    bad_letters << user_input

    -1
  end
end 

def get_word_for_print(letters, good_letters) #прорисовка прогресса угадывания слова
  
  result = ''

  letters.each { |letters| result += good_letters.include?(letters) ? letters + ' ' : '__' }
  
  result
  
end

def print_status(letters, good_letters, bad_letters, errors)
  puts "\nСлово: " + get_word_for_print(letters, good_letters)
  puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

  if errors >= 7 
    puts " Вы проиграли  :(\n\n"
  else
    if letters.uniq.size == good_letters.size
      puts "Поздравляем! Вы выиграли!\n\n"
    else
      puts "У вас осталось попыток: #{7 - errors}"
    end
  end
end

def cls
  system("clear") || system("cls")
end
