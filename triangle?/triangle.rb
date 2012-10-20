module Triangle
  def triangle?(side_a, side_b, side_c)
    # The sum of the lengths of any two sides of a triangle always exceeds the length of the third side, a principle known as the triangle inequality
    sides = [side_a, side_b, side_c].sort!
    if sides[0] + sides[1] > sides[2]
      true
    else
      false
    end
  end
end