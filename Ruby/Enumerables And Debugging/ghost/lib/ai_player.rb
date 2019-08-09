require_relative "./ai_names.rb"

class AiPlayer
  attr_reader :name
  def initialize
    @name = Ai_names.sample
  end

  def guess
    return 12345
  end

end