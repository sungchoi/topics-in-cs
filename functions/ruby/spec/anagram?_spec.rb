require_relative "../anagram?"

describe "anagram?(word1, word2)" do
  it "should return true when word1 and word2 are made up of the same number and kind of each character" do
    expect(anagram?("scared", "sacred")).to eq(true)
    expect(anagram?("lump", "plum")).to eq(true)
    expect(anagram?("mace", "came")).to eq(true)
    expect(anagram?("rescued", "seducer")).to eq(true)
    expect(anagram?("senator", "treason")).to eq(true)
  end

  it "should return false when word1 and word are not made up of the same number and kind of each character" do
    expect(anagram?("a", "b")).to eq(false)
    expect(anagram?("apple", "pappy")).to eq(false)
    expect(anagram?("happy", "sappy")).to eq(false)
    expect(anagram?("mop", "motorcycle")).to eq(false)
    expect(anagram?("anagram", "lexigram")).to eq(false)
    expect(anagram?("hamptions", "york")).to eq(false)
  end

  it "should not care about capitalization" do
    expect(anagram?("scared", "Sacred")).to eq(true)
    expect(anagram?("lump", "Plum")).to eq(true)
    expect(anagram?("Mace", "Came")).to eq(true)
    expect(anagram?("reScued", "sEducEr")).to eq(true)
    expect(anagram?("SenatoR", "trEasOn")).to eq(true)
  end

  it "should ignore white space" do
    expect(anagram?("scared", "   sacred")).to eq(true)
    expect(anagram?("lump", "plum ")).to eq(true)
    expect(anagram?("mace", " came ")).to eq(true)
    expect(anagram?("rescued", "  seducer ")).to eq(true)
  end

  it "should return true for multiword anagrams"
end
