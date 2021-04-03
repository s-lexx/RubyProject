if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require "./methods.rb"
cls
letters = get_letters
puts "slovo " + letters.to_s
errors = 0
good_letters = []
bad_letters = []
while errors < 7 do
  print_status(letters, good_letters, bad_letters, errors)
  puts "введите след. букву" 
  user_input = get_user_input
  result = check_result(user_input, letters, good_letters, bad_letters)
puts "result = " + result.to_s
  if (result == -1)
  		errors +=1
  elsif (result == 1)
    	break		
  end  	
end

print_status(letters, good_letters, bad_letters, errors)
 