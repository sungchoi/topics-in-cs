require_relative '../../binary_search_tree/node'

describe BinarySearchTree::Node do

  context "#include?(value)" do
    let(:tree){ BinarySearchTree::Node.new(1, BinarySearchTree::Node.new(2), BinarySearchTree::Node.new(3)) }

    it "returns true when the value is == to a value held by one of the nodes in the tree" do
      expect(tree.include?(1)).to eq(true)
      expect(tree.include?(2)).to eq(true)
      expect(tree.include?(3)).to eq(true)
    end

    it "returns false when the value is != to any of the values held by the nodes in the tree" do
      expect(tree.include?(4)).to eq(false)
      expect(tree.include?(5)).to eq(false)
      expect(tree.include?(6)).to eq(false)
    end

    it "raises an error if the value argument does not match the type of values in the tree"
  end

  context "#insert(value)" do
    let(:tree){ BinarySearchTree::Node.new(1) }
    it "inserts the value into the tree" do
      tree.insert(2)
      expect(tree.include?(2)).to eq(true)
    end

    it "inserts the value into the tree in the correct location"
  end

  context "#remove(value)" do
    it "removes the value from the tree"
    it "removes all copies of the value from the tree -- can the tree hold duplicates??"
  end

  context "#empty?" do
    it "returns true when..."
  end
end