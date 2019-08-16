require_relative "00_tree_node"

class KnightPathFinder
attr_accessor :considered_positions

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    self.build_move_tree
    @considered_positions = [pos] 
  end

  def build_move_tree #how do i assign all the position to nodes 
    # until @considered_positions
      self.valid_moves(@root_node.value).each do |val|
        new_nodes = PolyTreeNode.new(val)
        new_nodes.parent=(@root_node)
      end
  end
  
  # def find_path
  # end

  def self.valid_moves(current_pos)
    moves = [[-1,-2],[1,2],[-1,2],[1,-2],[-2,-1],[2,1],[-2,1],[2,-1]]
    row, col = current_pos[0], current_pos[1]
    valids = []
    
    moves.each do |move|
      x, y = move[0], move[1]
      move_on_row = (x + row)
      move_on_col = (y + col)
      if (move_on_row).between?(0,7) && (move_on_col).between?(0,7)
        valids << [move_on_row, move_on_col]
      end
    end
    valids
  end
  
  def new_move_positions(pos)
    new_arr = self.valid_moves(pos).select {|ele| !(@considered_positions.include?(ele)) }
    @considered_positions += new_arr
    new_arr 
  end 
end


