class Dict

  attr_reader :dictionary
  
  def initialize(filename)
    @filename = filename
    @dictionary = make_dict(@filename)
  end

  private

  def make_dict(filename)
    # raise "/languages/#{filename}.txt does not exist. Please enter a valid filename." if !File.exist?("./languages/#{filename}.txt")
    Set.new File.readlines("./languages/#{filename}.txt", chomp: true)
  end

end

