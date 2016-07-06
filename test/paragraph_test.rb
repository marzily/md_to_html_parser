require_relative 'test_helper'

class ParagraphTest < Minitest::Test
  attr_reader :md

  def setup
    input = File.read "./my_input.md"
    @md = Paragraph.new input
  end
end
