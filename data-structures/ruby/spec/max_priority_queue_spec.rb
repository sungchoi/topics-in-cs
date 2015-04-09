require_relative '../max_priority_queue'

describe MaxPriorityQueue do

  describe "#enqueue" do
    it " " do
      queue = MaxPriorityQueue.new
      queue.enqueue(10, "finish tests").enqueue(11, "mail letters")
      expect(queue.dequeue).to eq("mail letters")
      expect(queue.dequeue).to eq("finish tests")
    end
  end

  describe "#dequeue" do
    it " " do

    end
  end

end
