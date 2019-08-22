require_relative 'word_chainer.rb'
require_relative 'dict_writer.rb'

class WordChainerFrontend
  
  def initialize
    @language
    @source
    @target
    @dictionary
    @chainer
  end

  def new_chain
    system("clear")
    puts "***********************************"
    puts
    puts "      Welcome to Word Chainer!     "
    puts
    puts "***********************************"
    sleep(1.5)
    puts
    puts
    puts "Please choose the dictionary language you'd like to use from the following:
    
    1. English
    2. Italiano"
    puts
    @language = lang_menu(gets.chomp)
    puts "[Building dictionary....]"
    dict_writer = Dict.new(@language)
    @dictionary = dict_writer.dictionary
    puts "[Dictionary built!]"
    puts "Great, let's use the #{@language.capitalize} dictionary!"
    puts
    puts "What word should we use to start the chain?"
    puts
    @source = gets.chomp.downcase
    until valid_word?(@source)
      puts "That word is not in the chosen dictionary. Have another try!"
      @source = gets.chomp.downcase
    end
    puts
    puts "OK, and what word should we build a chain towards?"
    puts
    @target = gets.chomp.downcase
    until valid_word?(@target)
      puts "That word is not in the chosen dictionary. Have another try!"
      @target = gets.chomp.downcase
    end
    puts "OK, perfect. So we will use the #{@language.capitalize} dictionary to build a Word Chain between the words #{@source} and #{@target}. Does that sound right?"
    puts "If so, please enter 'y' below to start. If not, please enter 'n' and let's try this again, shall we?"
    if confirm
      start = Time.now
      @chainer = WordChainer.new(@dictionary)
      @chainer.run(@source, @target)
      puts @chainer.path.reverse
      finish = Time.now
      time_diff = finish - start
      puts
      puts "#{time_diff} seconds elapsed"
      puts "========================================"
    else
      self.new_chain
    end
  end

  private

  def lang_menu(option)
    case option
    when "1"
      "english"
    when "2"
      "italiano"
    else
      puts "I'm not sure what you mean. Please try again."
      lang_menu(gets.chomp)
    end
  end

  def valid_word?(word)
    @dictionary.include?(word)
  end

  def confirm
    confirm = gets.chomp.downcase
    case confirm
    when "y"
      return true
    when "n"
      return false
    else
      puts "I'm not sure what that means. Please enter 'y' or 'n' to continue."
      self.confirm
      # false
    end 
  end

end

WordChainerFrontend.new.new_chain