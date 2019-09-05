class PolyTreeNode

  attr_reader :parent, :position
  attr_accessor :children

  def initialize(position)
    @position = position
    @parent
    @children = []
  end

  def inspect
    { "Position" => @position, "Children" => @children }
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

  def dfs(target_position)
    return self if @position == target_position
    return nil if @children.empty?
    @children.each do |child| 
      node = child.dfs(target_position)
      next if node == nil
      return node if node.position == target_position
    end
    nil
  end

  def bfs(target_position)
    queue = []
    queue << self unless queue.include?(self)
    until queue.empty?
      node = queue.shift
      return node if node.position == target_position
      node.children.each { |child| queue << child }
    end
  end

end
