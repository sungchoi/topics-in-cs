require_relative '../min_priority_queue'

describe MinPriorityQueue do

  describe "#enqueue" do
    it " " do
      queue = MinPriorityQueue.new
      queue.enqueue(10, "finish tests").enqueue(9, "mail letters")
      expect(queue.dequeue).to eq("mail letters")
      expect(queue.dequeue).to eq("finish tests")
    end
  end

  describe "#dequeue" do
    it " " do

    end
  end

end
