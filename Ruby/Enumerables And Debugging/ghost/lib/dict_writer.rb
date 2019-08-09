class Dict

  LANGUAGE = {
    english: "languages/english.txt",
    # french: "languages/francais.txt",
    # german: "languages/deutsch.txt",
    italian: "languages/italiano.txt",
    test: "languages/test.txt",
    names: "languages/names.txt"
  }
  def initialize(lang)
    @lang = lang.to_sym
    @sel_prc = Proc.new { |word| word.length >= 3 }
    set_file = File.open("lib/game_dict.rb", "w")
    set_file.puts "require 'Set'"
    set_file.print "Game_dict = Set"
    set_file.print File.readlines(LANGUAGE[@lang], chomp: true, downcase: true).select(&@sel_prc).map(&:downcase)
  end

  def self.languages
    LANGUAGE
  end

end

Dict.new("english")

# def dict_writer
#   set_file = File.open("lib/game_dict.rb", "w")
#   # dict_file = File.open("dictionary.txt", "r")
#   set_file.print "Fr_dict = Set"
#   set_file.print File.readlines("lib/testfrdict.txt", chomp: true).select { |word| word.length >= 3 }
# end


