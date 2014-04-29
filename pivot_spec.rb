require './pivot'

describe "The pivot finder" do
  it "returns -1 for an array with only one item" do
    test_array = [1]
    find_pivot(test_array).should eq(-1)
  end

  it "returns -1 for an array with only two items" do
    test_array = [1, 2]
    find_pivot(test_array).should eq(-1)
  end

  it "returns -1 for an array without a pivot" do
    test_array = [1, 2, 3]
    find_pivot(test_array).should eq(-1)
  end

  it "returns 2 for [1, 4, 6, 3, 2]" do
    test_array = [1, 4, 6, 3, 2]
    find_pivot(test_array).should eq(2)
  end

  it "returns 2 for [1, 4, -3000, 3, 2]" do
    test_array = [1, 4, -3000, 3, 2]
    find_pivot(test_array).should eq(2)
  end

  it "returns 4 for [1, 4, 1, 4, 6, 3, 2, 3, 2]" do
    test_array = [1, 4, 1, 4, 6, 3, 2, 3, 2]
    find_pivot(test_array).should eq(4)
  end

  it "returns 5 for [1, 4, 6, 3, 2, 30000, 1, 4, 6, 3, 2]" do
    test_array = [1, 4, 6, 3, 2, 30000, 1, 4, 6, 3, 2]
    find_pivot(test_array).should eq(5)
  end

  it "returns 11 for [1, 4, 6, 3, 2, 30000, 1, 4, 6, 3, 2, -99999999, 1, 4, 6, 3, 2, 30000, 1, 4, 6, 3, 2]" do
    test_array = [1, 4, 6, 3, 2, 30000, 1, 4, 6, 3, 2, -99999999, 1, 4, 6, 3, 2, 30000, 1, 4, 6, 3, 2]
    find_pivot(test_array).should eq(11)
  end
end
