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

def check_input(user_input, letters, good_letters, bad_letters) # проверка результата хода игрока
  return 0 if good_letters.include?(user_input) || bad_letters.include?(user_input)
  if letters.include?(user_input) || (user_input == 'е' && letters.include?('ё')) || (user_input == 'ё' && letters.include?('е')) ||
     (user_input == 'и' && letters.include?('й')) || (user_input == 'й' && letters.include?('и'))
     if user_input == 'е'
        good_letters << 'ё'
     end
     if user_input == 'ё'
        good_letters << 'е'
     end
     if user_input == 'и'
        good_letters << 'й'
     end
     if user_input == 'й'
        good_letters << 'и'
     end
    
     good_letters << user_input

     (letters - good_letters).empty? ? 1 : 0
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
    if (letters - good_letters).empty?
      puts "Поздравляем! Вы выиграли!\n\n"
    else
      puts "У вас осталось попыток: #{7 - errors}"
    end
  end
end

def cls
  system("clear") || system("cls")
end
