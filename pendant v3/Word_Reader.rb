class WordReader

  def read_from_file(file_path)

    strings = ""

      if File.exist?(file_path)

        f = File.new(file_path, "r:UTF-8")

        strings = f.readlines

        f.close

        strings.sample.chomp

      else return strings

      end

  end

end