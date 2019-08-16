class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent 
    @parent
  end
  
  def children
    @children
  end

  def value
    @value 
  end

  def parent=(node)
    self.parent.children.delete(self)  if self.parent != nil    
    @parent = node 
    node.children << self unless self.parent == nil || node.children.include?(self)  
  end 

  def add_child(child_node)
    child_node.parent=(self) 
  end

  def remove_child(child_node)
    raise "child node does not have a parent" if child_node.parent.nil?
    child_node.parent=(nil) 

  end 

  def dfs(target)
    return self if target == self.value 

    self.children.each do |child| 
      result = child.dfs(target)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target)
    queue = [self]
    
    until queue.empty?
      first = queue.shift  
      if first.value == target
        return first
      else 
        queue += (first.children) 
      end
    end
  end
end
