require_relative '../max_heap_node'

describe MaxHeapNode do

  describe "#initialize" do
    it "should take a key_value argument" do
      max_heap = MaxHeapNode.new([1, "a"])
      expect(max_heap.peek.key).to eq(1)
      expect(max_heap.peek.value).to eq("a")
    end

    it "should heapify the heap" do
      max_heap = MaxHeapNode.new([1, "a"], MaxHeapNode.new([3, "b"]), MaxHeapNode.new([5, "c"]))
      expect(max_heap.peek.key).to eq(5)
    end
  end

  describe "#build_max_heap" do
  end

  describe "#==" do
  end

  describe "#empty?" do
    it "returns false when there is one or more items in the heap" do
      expect(MaxHeapNode.new(1).empty?).to eq(false)
    end
  end

  describe "#peek" do
    it "" do
      max_heap = MaxHeapNode.new(3, MaxHeapNode.new(2), MaxHeapNode.new(1))
      expect(max_heap.peek.key).to eq(3)
      expect(max_heap.peek.value).to eq(nil)
    end
  end

  describe "#insert" do
    it "should insert greater keys higher up the tree" do
      max_heap = MaxHeapNode.new([1, "a"]).insert([2, "b"])
      expect(max_heap.peek.key).to eq(2)
      expect(max_heap.peek.value).to eq("b")
    end

    it "should insert nodes left to right" do
      max_heap = MaxHeapNode.new([1, "a"]).insert([2, "b"])
      expect(max_heap.left.peek.key).to eq(1)
      expect(max_heap.left.peek.value).to eq("a")
    end

    it "should return a sorted max heap node" do
      max_heap = MaxHeapNode.new(11).insert(5)
                           .insert(10).insert(3)
                           .insert(4).insert(8)
      expect(max_heap.sorted?).to eq(true)
    end
  end

  describe "#delete" do
    it "should return the MaxHeapNode class when there is only one node in the tree" do
      max_heap = MaxHeapNode.new(1)
      max_heap = max_heap.delete
      expect(max_heap).to eq(MaxHeapNode)
      expect(max_heap.empty?).to eq(true)
    end

    it "should delete the top node" do
      max_heap = MaxHeapNode.new(1).insert(2)
      max_heap = max_heap.delete

      expect(max_heap.empty?).to eq(false)
      expect(max_heap.peek.key).to eq(1)
    end
  end

  describe "#full?" do
    it "should return false when it has less than two children" do
      expect(MaxHeapNode.new(1).full?).to eq(false)
      expect(MaxHeapNode.new(1, MaxHeapNode.new(0), MaxHeapNode).full?).to eq(false)
    end

    it "should return true when it has two children" do
      expect(MaxHeapNode.new(3, MaxHeapNode.new(1), MaxHeapNode.new(2)).full?).to eq (true)
    end
  end

  describe "#leaf?" do
    it "should return true when it has no children" do
      expect(MaxHeapNode.new(1).leaf?).to eq(true)
    end

    it "should return false when it has one or more children" do
      expect(MaxHeapNode.new(2, MaxHeapNode.new(1)).leaf?).to eq(false)
      expect(MaxHeapNode.new(3, MaxHeapNode.new(1), MaxHeapNode.new(2)).leaf?).to eq(false)
    end
    
  end


end
