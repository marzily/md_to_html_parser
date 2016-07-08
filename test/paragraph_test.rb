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

  def test_it_turns_multiline_text_into_paragraphs
    input = '"You just have to try the cheesecake," he said. "Ever since it appeared in Food & Wine this place has been packed every night."'

    assert_equal "<p>#{input}</p>", Paragraph.new(input).to_html
  end

  def test_it_turns_lines_separated_by_a_single_line_break_into_a_paragraph
    input = "hello\nsummer"

    assert_equal "<p>#{input}</p>", Paragraph.new(input).to_html
  end

  def test_it_turns_lines_separated_by_two_line_breaks_into_separate_paragraphs
    input = "hello\n\nsummer"

    assert_equal "<p>hello</p>\n<p>summer</p>", Paragraph.new(input).to_html
  end
end
