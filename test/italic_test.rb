require_relative 'test_helper'

class ItalicTest < Minitest::Test
  attr_reader :md_text

  def setup
    input = File.read "./my_input.md"
    @md_text = Italic.new(input.split("\n"))
  end

  def test_it_converts_italics_to_html
    skip
    html = ["<h1>My Life in Desserts</h1>", "", "<h2>Chapter 1: The Beginning</h2>",
            "", "\"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in", "**Food & Wine** this place has been packed every night.\""]
    assert_equal html, md_text.to_html
  end
end
