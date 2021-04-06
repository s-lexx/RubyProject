def get_letters # проверка и получение слова от пользователя
  words = ARGV[0]
  if(words == nil || words == "")
  	 abort "Вы не загадали слово для игры"
  end
  return words.encode('UTF-8').split('')
end

def get_user_input # пользователь угадывает букву
	 letter = ''
	 while letter == '' do
		 letter = STDIN.gets.encode('UTF-8').chomp
	 end
	letter
end

def check_result(user_input, letters, good_letters, bad_letters) # проверка результата хода игрока
		if(good_letters.include?(user_input) ||
			 bad_letters.include?(user_input))
		return 0
		end
		if letters.include? user_input
			 good_letters << user_input
	 	if letters.uniq.size == good_letters.size
		return 1
	  else
		return 0	
		end
		else
		  bad_letters << user_input 
		return -1
		end
end	

def get_word_for_print(letters, good_letters) #прорисовка прогресса угадывания слова
		result = ''
		letters.each do |letters|  										
				  if (good_letters.include? letters)
					result += letters + ' '
					else
					result += '__'
					end	
				end		
	result
end

def print_status(letters, good_letters, bad_letters, errors)
	 puts "\nСлово: " + get_word_for_print(letters, good_letters)
	 puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"
	 if errors >= 7 
		 puts " Вы проиграли  :("
	 else
		 if letters.uniq.size == good_letters.size
			 puts "Поздравляем! Вы выйграли!\n\n"
		 else
			 puts "У вас осталось попыток: " + (7-errors).to_s
		 end			
	end	
end	

def cls
system "clear" or system "cls"
end
