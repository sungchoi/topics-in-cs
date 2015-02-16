module BinaryTree

  def BinaryTree(value, left = nil, right = nil)
    case value
    when BinaryTree::Node
      value
    else
      BinaryTree::Node.new(value, left, right)
    end
  end

end
