require_relative 'test_helper'

class ListTest < Minitest::Test

  def test_it_turns_unordered_list_into_html
    md = "* Sushi\n* Barbeque\n* Mexican\n"
    html = "<ul>\n  <li>Sushi</li>\n  <li>Barbeque</li>\n  <li>Mexican</li>\n</ul>"

    assert_equal html, List.new(md).to_html
  end

  def test_it_turns_ordered_list_into_html
    md = "1. Sushi\n2. Barbeque\n3. Mexican\n"
    html = "<ol>\n  <li>Sushi</li>\n  <li>Barbeque</li>\n  <li>Mexican</li>\n</ol>"

    assert_equal html, List.new(md).to_html
  end


end
