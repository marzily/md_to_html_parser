require_relative 'test_helper'

class ParagraphTest < Minitest::Test
  attr_reader :md

  def setup
    input = File.read "./my_input.md"
    @md = Paragraph.new input
  end

  def test_it_finds_the_right_content
    md.md = "# My Life in Desserts"
    assert_equal "", md.paragraph
  end
end
