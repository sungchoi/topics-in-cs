module StringPalindrome
	def palindrome?
	  this = self.downcase
	  this = this.split(/\W/).join("")
	  for i in 0..(self.length - 1) / 2
	    if this[i] != this[-i - 1]
  	    return false
      end
    end
        return true
	end
end

module NumberPalindrome
  def palindrome?
    
  end
end


class String
  include StringPalindrome
end

class Fixnum
  include NumberPalindrome
end

class Bignum
  include NumberPalindrome
end
