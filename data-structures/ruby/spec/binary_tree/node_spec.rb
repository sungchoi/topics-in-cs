require_relative '../../binary_tree/node'

describe BinaryTree::Node do
  let(:tree) { BinaryTree::Node.new(2, BinaryTree::Node.new(1), BinaryTree::Node.new(3)) }

  it "#value" do
    #TODO
    expect(tree.value).to eq(2)
  end

  it "#left" do
    #TODO
    expect(tree.left == BinaryTree::Node.new(1)).to eq(true)
    expect(tree.right == BinaryTree::Node.new(3)).to eq(true)
    expect(tree == BinaryTree::Node.new(2)).to eq(false)
  end
 
  it "#right" do
    #TODO
  end

  it "#children" do
    #TODO
  end

  it "#each" do
    #TODO
  end

  it "#pre_order" do
    #TODO
  end

  it "#in_order" do
    #TODO
  end

  it "#post_order" do
    #TODO
  end

  it "#==" do
    #TODO
  end

end
