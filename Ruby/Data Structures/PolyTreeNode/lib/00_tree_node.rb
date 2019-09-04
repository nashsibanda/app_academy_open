require "byebug"

class PolyTreeNode

  attr_reader :parent, :value
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent
    @children = []
  end

  def inspect
    { "Value" => @value, "Children" => @children }
  end

  def parent=(node)
    if @parent
      @parent.children.delete(self)
    end
    @parent = node
    node.children << self unless node == nil || node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise if !child_node.parent
    child_node.parent = nil
  end

  def dfs(target_value)
    # debugger
    return self if @value == target_value
    return nil if @children.empty?
    @children.each do |child| 
      node = child.dfs(target_value)
      next if node == nil
      return node if node.value == target_value
    end
    nil
  end

end
