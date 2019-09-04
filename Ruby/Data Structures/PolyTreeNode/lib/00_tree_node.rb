class PolyTreeNode

  attr_reader :parent, :value
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent
    @children = []
  end

  def parent=(node)
    if @parent
      @parent.children.delete(self)
    end
    @parent = node
    node.children << self unless node == nil || node.children.include?(self)
  end

end