require_relative "./node.rb"

class Queen

  attr_reader :name
  attr_accessor :node

  def initialize(q_name, node, n)
    @name = q_name
    @n = n
    @node = node
  end

  def position
    @node.position
  end

  def conflicts
    @node.conflicts
  end

end