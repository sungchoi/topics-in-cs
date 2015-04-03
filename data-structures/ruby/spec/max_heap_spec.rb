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
      max_heap = MaxHeap.new([3, 2, 1])
      expect(max_heap.peek.key).to eq(3)
      expect(max_heap.peek.value).to eq(nil)
    end
  end

  describe "#insert!" do
    it "" do
      max_heap = MaxHeap.new
      max_heap.insert!([1, "a"])
      expect(max_heap.peek.key).to eq(1)
      expect(max_heap.peek.value).to eq("a")
    end

    it "" do
      max_heap = MaxHeap.new
      max_heap.insert!([1, "a"]).insert!([2, "b"])
      expect(max_heap.peek.key).to eq(2)
      expect(max_heap.peek.value).to eq("b")
    end

    it "" do
      max_heap = MaxHeap.new.insert!(11).insert!(5)
                           .insert!(10).insert!(3)
                           .insert!(4).insert!(8)
      max_heap_two = MaxHeap.new([11, 5, 10, 3, 4, 8])
      expect(max_heap == max_heap_two).to eq(true)
    end
  end

  describe "#delete!" do
    it " " do
      max_heap = MaxHeap.new.insert!(1)
      max_heap.delete!
      expect(max_heap.empty?).to eq(true)
    end

    it "" do
      max_heap = MaxHeap.new.insert!(1).insert!(2)
      max_heap.delete!
      expect(max_heap.empty?).to eq(false)
      expect(max_heap.peek.key).to eq(1)
    end

    it "" do
      max_heap = MaxHeap.new.insert!(11).insert!(5)
                            .insert!(10).insert!(3)
                            .insert!(4).insert!(8)
      max_heap.delete!
      expect(max_heap == MaxHeap.new([10, 5, 8, 3, 4])).to eq(true)

    end

    it " " do
      max_heap = MaxHeap.new([10, 5, 8, 3, 4])
      max_heap.delete!
      expect(max_heap == MaxHeap.new([8, 5, 4, 3])).to eq(true)
    end
  end

  describe "#parent_index(i)" do
    it "" do
      max_heap = MaxHeap.new
      expect(max_heap.parent_index(1)).to eq(0)
      expect(max_heap.parent_index(2)).to eq(0)
      expect(max_heap.parent_index(3)).to eq(1)
      expect(max_heap.parent_index(4)).to eq(1)
      expect(max_heap.parent_index(5)).to eq(2)
      expect(max_heap.parent_index(6)).to eq(2)
    end
  end

end
