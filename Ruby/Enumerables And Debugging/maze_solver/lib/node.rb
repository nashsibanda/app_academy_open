require "byebug"

class Node

  attr_reader :position, :h_score, :nearby_nodes, :content
  attr_accessor :g_score, :f_score, :prospective_f_score

  def initialize(position, h_score, max, content)
    @position = position
    @h_score = h_score
    @nearby_nodes = []
    @nearby_nodes.push([(position[0]-1), position[1]]).push([(position[0]), (position[1]+1)]).push([(position[0]+1), position[1]]).push([(position[0]), (position[1]-1)])
    @nearby_nodes.delete_if { |coords| coords[0] < 0 || coords[1] < 0 || coords[0] > (max[0] - 1) || coords[1] > (max[1] - 1)}
    @content = content
    @g_score = 0
    @f_score = 0
    @prospective_f_score = 0
  end

  def calc_f_score
    @f_score = @h_score + @g_score    
  end

  def calc_prospective_f_score(new_g_score)
    # debugger
    @prospective_f_score = @h_score + new_g_score
  end

end