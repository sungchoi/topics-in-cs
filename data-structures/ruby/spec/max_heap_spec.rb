require_relative '../max_heap'

describe MaxHeap do

  describe "#peek" do
    it "" do
      maxHeap = MaxHeap.new([3, 2, 1])
      expect(maxHeap.peek.key).to eq(3)
      expect(maxHeap.peek.value).to eq(nil)
    end
  end

  describe "#insert" do
  end

  describe "#delete" do
  end

end
