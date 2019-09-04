class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent
    @children = []
  end

  def parent=(node)
    @parent = node
    node.children << self unless node == nil || node.children.include?(self)
  end

end