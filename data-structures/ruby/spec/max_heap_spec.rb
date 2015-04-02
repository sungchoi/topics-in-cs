require_relative '../max_heap'

describe MaxHeap do

  describe "#==" do
    it " " do
      expect(MaxHeap.new.insert!(1).insert!(2) == MaxHeap.new.insert!(2).insert!(1)).to eq(true)
      expect(MaxHeap.new.insert!(1) == MaxHeap.new.insert!(2)).to eq(false)
    end
  end

  describe "#empty?" do
    it "returns true when there is nothing in the heap" do
      expect(MaxHeap.new.empty?).to eq(true)
    end

    it "returns false when there is one or more items in the heap" do
      expect(MaxHeap.new.insert!(1).empty?).to eq(false)
    end
  end

  describe "#peek" do
    it "" do
      maxHeap = MaxHeap.new([3, 2, 1])
      expect(maxHeap.peek.key).to eq(3)
      expect(maxHeap.peek.value).to eq(nil)
    end
  end

  describe "#insert!" do
    it "" do
      maxHeap = MaxHeap.new
      maxHeap.insert!([1, "a"])
      expect(maxHeap.peek.key).to eq(1)
      expect(maxHeap.peek.value).to eq("a")
    end

    it "" do
      maxHeap = MaxHeap.new
      maxHeap.insert!([1, "a"]).insert!([2, "b"])
      expect(maxHeap.peek.key).to eq(2)
      expect(maxHeap.peek.value).to eq("b")
    end
  end

  describe "#delete!" do
    it " " do
      max_heap = MaxHeap.new.insert!(1)
      max_heap.delete!
      puts max_heap.array
      expect(max_heap.empty?).to eq(true)
    end

    it "" do
      max_heap = MaxHeap.new.insert!(1).insert!(2)
      max_heap.delete!
      expect(max_heap.empty?).to eq(false)
      expect(max_heap.peek.key).to eq(1)
    end
  end

end
