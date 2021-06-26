class Game

  def initialize(word)
  
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0

  end

  def get_letters(word) # проверка ввода слова пользователем

    abort "Вы не загадали слово для игры" if (word == nil) || (word == "")

    word.split('')
  
  end
    
  def ask_next_letter # запрос буквы

    puts "\n Введите следующую букву"
    letter = ''

    while letter == ''

    letter = STDIN.gets.encode('UTF-8').chomp

    end

    next_step(letter)

  end

  def next_step(letter) # определение далнейшого хода игры

    if @status == -1 || @status == 1

    return

    end

    return 0 if @good_letters.include?(letter) || @bad_letters.include?(letter)

    if @letters.include?(letter)

       @good_letters << letter

       if(@good_letters.uniq.sort) == (@letters.uniq.sort)

         @status = 1

       end

    else

      @bad_letters << letter
      @errors += 1

      if @errors >= 7

        @status = -1

      end
    end
  end
  # геттеры для полей класса
  def status

    @status

  end

  def errors

    @errors

  end

  def letters

    @letters

  end
    
  def good_letters

    @good_letters

  end

  def bad_letters

    @bad_letters

  end

  end