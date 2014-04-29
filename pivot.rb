# Extend the Array class to create a sum helper method.
#
class Array
  def sum
    self.inject(:+)
  end
end

# Check the input to make sure that it's valid. Catch anything that would fail
# immediately, instead of passing it along to the test phase.
#
def valid_input?(input)
  if input.count == 1
    # Don't allow arrays with only one item.
    false
  elsif input.count == 2
    # Don't allow arrays with only two items.
    false
  else
    # Allow everything else to be tested.
    true
  end
end

# Our main pivot finding method!
#
def find_pivot(input)
  # puts "Finding pivot for #{input}"

  return -1 unless valid_input?(input)

  # Setup the Arrays we're going to be working with.
  left_side = input
  right_side = []

  # Find the sum of all of the provided numbers and check if it's even.
  original_sum = input.sum
  is_even = original_sum.even?

  # Move the first and second item of the Array to the right side and make sure
  # they're removed from the left.
  right_side << left_side[0]
  left_side.delete_at(0)

  pivot_test = left_side[0]
  left_side.delete_at(0)

  # Loop through all of the items in the left array until it's empty. This is
  # where we'll find our pivot.
  while left_side.count > 0
    if is_even == pivot_test.even?
      if left_side.sum == right_side.sum
        return left_side.count
      end
    end

    right_side << pivot_test
    pivot_test = left_side[0]
    left_side.delete_at(0)
  end

  # If all else fails, return -1.
  return -1
end
