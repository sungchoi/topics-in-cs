require_relative '../binary_search_tree_node'

describe BinarySearchTreeNode do

  describe "#include?(value)" do
    let(:tree){ BinarySearchTreeNode.new(2, BinarySearchTreeNode.new(1), BinarySearchTreeNode.new(3)) }
    let(:unsorted_tree){ BinarySearchTreeNode.new(1, BinarySearchTreeNode.new(2), BinarySearchTreeNode.new(3)) }

    it "returns true when the value is == to a value held by the root node in the tree" do
      expect(tree.include?(2)).to eq(true)
    end

    it "returns true when the value is == to a value held by one of the child nodes in the tree" do
      expect(tree.include?(1)).to eq(true)
      expect(tree.include?(3)).to eq(true)
    end

    it "returns false when the value is != to any of the values held by the nodes in the tree" do
      expect(tree.include?(4)).to eq(false)
      expect(tree.include?(5)).to eq(false)
      expect(tree.include?(6)).to eq(false)
    end

    it "raises an error if the value argument does not match the type of values in the tree"
  end

  describe "#insert(value)" do

    it "inserts the value into the tree" do
      tree = BinarySearchTreeNode.new(1)
      tree = tree.insert(2)
      expect(tree).to eq(BinarySearchTreeNode.new(1, BinarySearchTreeNode, BinarySearchTreeNode.new(2)))
      expect(tree.include?(2)).to eq(true)
      tree = tree.insert(3)
      tree = tree.insert(5)
      expect(tree.sorted?).to eq(true)
    end

    it "inserts the value into the tree in the correct location"
  end

  describe "#remove(value)" do
    # let(:tree){ BinarySearchTreeNode.new(1) }

    it "removes the value from the tree" do
      tree = BinarySearchTreeNode.new(1)
      # TODO: Make remove non destructive so that reassignment is the norm.
      # TODO: Is there a way to make this reassignment unnecessary or is this desirable?
      tree = tree.remove(1)
      expect(tree.include?(1)).to eq(false)

      tree = BinarySearchTreeNode.new(1, BinarySearchTreeNode, BinarySearchTreeNode.new(2))
      tree = tree.remove(2)
      expect(tree.include?(2)).to eq(false)

      tree = BinarySearchTreeNode.new(1,  BinarySearchTreeNode.new(0),
                                          BinarySearchTreeNode.new(3,
                                            BinarySearchTreeNode.new(2),
                                            BinarySearchTreeNode.new(4)))
      tree = tree.remove(4)
      expect(tree.include?(4)).to eq(false)
      expect(tree.sorted?).to eq(true)

      tree = BinarySearchTreeNode.new(4, BinarySearchTreeNode.new(3), BinarySearchTreeNode.new(7))
      tree = tree.remove(4)
      expect(tree.include?(4)).to eq(false)
      expect(tree.sorted?).to eq(true)
    end

    it "removes all copies of the value from the tree -- can the tree hold duplicates??"
  end

  describe "#empty?" do
    it "returns true when it is an uninstantiated node" do
      expect(BinarySearchTreeNode.empty?).to eq(true)
    end

    it "returns false when it is an instantiated node" do
      expect(BinarySearchTreeNode.new(1).empty?).to eq(false)
    end
  end

  describe "#size" do
    let(:tree){ BinarySearchTreeNode.new(2, BinarySearchTreeNode.new(1), BinarySearchTreeNode.new(3)) }

    it "returns the number of nodes in the tree" do
      expect(tree.size).to eq(3)
    end
  end

  describe "#sorted?" do
    let(:sorted_tree){ BinarySearchTreeNode.new(2, BinarySearchTreeNode.new(1), BinarySearchTreeNode.new(3)) }
    let(:unsorted_tree){ BinarySearchTreeNode.new(1, BinarySearchTreeNode.new(2), BinarySearchTreeNode.new(3)) }

    it "returns true for a sorted tree" do
      expect(sorted_tree.sorted?).to eq(true)
    end

    it "returns false for an unsorted tree" do
      expect(unsorted_tree.sorted?).to eq(false)
    end

  end

end