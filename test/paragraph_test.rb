require_relative 'test_helper'

class ParagraphTest < Minitest::Test
  attr_reader :md

  def setup
    input = File.read "./my_input.md"
    @md = Paragraph.new input
  end

  def test_it_turns_md_into_html
    input = "My Life in Desserts"

    assert_equal "<p>My Life in Desserts</p>", Paragraph.new(input).to_html
  end
end
