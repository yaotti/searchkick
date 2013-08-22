require_relative "test_helper"

class TestMehul < Minitest::Unit::TestCase

  def test_mehul
    Product.create!(name: "111")
    Product.create!(name: "222")
    Product.tire.index.refresh
    assert_equal 1, Product.search("111").results.count
    assert_equal 1, Product.search("222").results.count
  end

end
