require_relative 'test_helper'

class BoldTest < Minitest::Test
  attr_reader :md_text

  def setup
    input = File.read "./my_input.md"
    @md_text = Bold.new(input.split("\n"))
  end

  def test_it_finds_bold_in_md_text
    skip
    assert_equal "**hello**", md_text.find_bold("**hello** summer")
  end

  def test_it_doesnt_find_bold_if_none
    skip
    assert_equal "", md_text.find_bold("*hello* summer")
  end

  def test_it_converts_bold_to_html
    skip
    html = ["<h1>My Life in Desserts</h1>", "", "<h2>Chapter 1: The Beginning</h2>",
            "", "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in", "<strong>Food & Wine</strong> this place has been packed every night.\""]
    assert_equal html, md_text.to_html
  end
end
