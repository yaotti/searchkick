require_relative "test_helper"

class TestGroupQueries < Minitest::Unit::TestCase

  def test_grouping
    assert_equal [{query: "apples", count: 6, variations: [{query: "apples", count: 3}, {query: "apple", count: 2}, {query: "APPLE", count: 1}]}], Searchkick.group_queries({"APPLE" => 1, "apples" => 3, "apple" => 2})
  end

end
