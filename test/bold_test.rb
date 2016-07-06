require_relative 'test_helper'

class BoldTest < Minitest::Test
  attr_reader :md

  def setup
    input = File.read "./my_input.md"
    @md = Bold.new(input)
  end

  def test_it_finds_bold_in_md_text
    assert_equal "Food & Wine", md.find_bold
  end

  def test_it_doesnt_find_bold_if_none
    md.md = "*hello* summer"

    assert_equal "", md.find_bold
  end

  def test_it_converts_bold_to_html
    skip
    html = ["<h1>My Life in Desserts</h1>", "", "<h2>Chapter 1: The Beginning</h2>",
            "", "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in", "<strong>Food & Wine</strong> this place has been packed every night.\""]
    assert_equal html, md.to_html
  end
end
