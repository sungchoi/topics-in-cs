module BinarySearchTree

  def BinarySearchTreeNode(value, parent = nil, left = nil, right = nil)
    case value
    when BinarySearchTree::Node
      value
    else
      BinarySearchTree::Node.new(value, parent, left, right)
    end
  end

end
