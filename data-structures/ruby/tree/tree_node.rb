module Tree

  def TreeNode(value, children = [])
    case value
    when Tree::Node
      value
    else
      Tree::Node.new(value, children)
    end
  end

end
