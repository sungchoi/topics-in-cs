require_relative '../key_value'

describe KeyValue do
  describe "#key" do
    it "returns the key attribute" do
      key_value = KeyValue.new(1, nil)
      key_value2 = KeyValue.new("hello", nil)
      expect(key_value.key).to eq(1)
      expect(key_value2.key).to eq("hello")
    end
  end

  describe "#value" do
    it "returns the value attribute" do
      key_value = KeyValue.new(1, "one")
      key_value2 = KeyValue.new(2, 2)
      expect(key_value.value).to eq("one")
      expect(key_value2.value).to eq(2)
    end
  end

  describe "#<=>" do
    it "correctly compares instances using their keys" do
      expect(KeyValue.new(1) < KeyValue.new(2)).to eq(true)
      expect(KeyValue.new(2) < KeyValue.new(1)).to eq(false)

      expect(KeyValue.new("one") == KeyValue.new("one")).to eq(true)
      expect(KeyValue.new(2) == KeyValue.new(1)).to eq(false)

      expect(KeyValue.new("one") > KeyValue.new("one")).to eq(false)
      expect(KeyValue.new(2) > KeyValue.new(1)).to eq(true)
    end

  end
end

