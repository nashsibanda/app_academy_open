class Solver
  attr_reader :maze, :current_node, :closed_list, :path, :path_coords

  def initialize(maze, start, goal)
    @maze = maze
    @open_list = []
    @closed_list = []
    @current_node
    @start_node = maze[start[0], start[1]]
    @goal_node = maze[goal[0], goal[1]]
    @open_list << @start_node
    @path = []
    @path_coords
    @parents = {}
    @parents[@start_node] = nil
    self.resolving
  end

  def lowest_f_score
    selected_node = nil
    @open_list.each do |node|
      selected_node = node if selected_node == nil
      selected_node = node if node.f_score < selected_node.f_score
    end
    selected_node
  end  

  def resolving
    while !@open_list.empty?
      @current_node = self.lowest_f_score
      @open_list.delete_if { |node| node == @current_node }
      @closed_list << @current_node
      @current_node.nearby_nodes.each do |node|
        node = maze[node[0], node[1]]
        if @maze.empty_spaces.include?(node.position) && !@closed_list.include?(node)
          if !@open_list.include?(node)
            node.g_score = 1 + @current_node.g_score
            node.calc_f_score
            @parents[node] = @current_node
            @open_list << node
          else
            new_g_score = 1 + @current_node.g_score
            node.calc_prospective_f_score(new_g_score)
            if node.prospective_f_score < node.f_score
              node.f_score = node.prospective_f_score
              @parents[node] = @current_node
            end
          end
        end
      end
      break if @closed_list.include?(@goal_node)
    end
    @path << @current_node
    this_node = @current_node
    while this_node != @start_node
      @path << @parents[this_node]
      this_node = @parents[this_node]
    end
    @path_coords = @path.reverse.map { |node| node.position }
  end

end