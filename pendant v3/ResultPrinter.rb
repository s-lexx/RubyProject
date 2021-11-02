class ResultPrinter

  def initialize 

    @status_image = []

    current_path = File.dirname(__FILE__)

    counter = 0

    while counter <= 7 do

      file_name = current_path + "/image/#{counter}.txt"

      if File.exist?(file_name)

        f = File.new(file_name, "r:UTF-8")

        @status_image << f.read

        f.close

      else @status_image << "\n [ изображение не найдено ] \n"

      end

      counter += 1

    end

  end

  def cls # очистка экрана

    (system "clear") || (system "cls")

  end

  def print_status(game) # отображения состояния игры вывод информации и прорисовка

    cls
    puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки: #{game.bad_letters.join(", ")}"

    print_pendant(game.errors)

    if game.status == -1

      puts "Вы проиграли :("
      puts "Загаданное слово было: " + game.letters.join("")

    elsif game.status == 1

      puts "Поздравляем, вы выиграли!"

    else

      puts "У вас осталось ошибок: " + (7 - game.errors).to_s

    end

  end

  def get_word_for_print(letters, good_letters) # формирование угаданного слова для вывода на экран

    result = ""

    letters.each { |letters| result += good_letters.include?(letters) ? letters + ' ' : '__' }

    result

  end

  def print_pendant(errors) # прорисовка

    puts @status_image[errors]

  end


end
