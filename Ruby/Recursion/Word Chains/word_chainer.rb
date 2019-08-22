require 'Set'
require 'byebug'

class WordChainer

  attr_reader :dictionary, :path
  
  def initialize(dictionary_file_name)
    @dictionary = make_dict(dictionary_file_name)
    @current_words = []
    @all_seen_words = {}
    @path = []
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words[source] = nil
    explore_current_words until @current_words.empty? || @all_seen_words.include?(target)
    build_path(target)
  end

  private
  
  def build_path(target)
    # debugger
    prior = @all_seen_words[target]
    @path << target
    return if prior == nil
    build_path(prior)
  end

  def adjacent_words(word)
    adj_words, same_size = [], @dictionary.select { |d_word| d_word.length == word.length }
    same_size.each do |s_word|
      diffs = 0
      s_word.each_char.with_index do |s_word_char, s_idx|
        word.each_char.with_index { |word_char, w_idx| diffs += 1 if s_word_char != word_char && s_idx == w_idx }
      end
      adj_words << s_word if diffs == 1
    end
    Set.new adj_words
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |c_word|
      adjacent_words(c_word).each do |adj_word|
        next if @all_seen_words.include?(adj_word)
        new_current_words << adj_word
        @all_seen_words[adj_word] = c_word
      end
    end
    # new_current_words.each do |nc_word|
    #   p "#{nc_word}, from #{@all_seen_words[nc_word]}"
    # end
    @current_words = new_current_words
  end

  def make_dict(filename)
    Set.new File.readlines("#{filename}.txt", chomp: true)
  end


end

start = Time.now
temp = WordChainer.new("english")
# p temp.dictionary
temp.run("duck", "ruby")
p temp.path.reverse
finish = Time.now
time_diff = finish - start
puts
puts "#{time_diff} seconds elapsed"