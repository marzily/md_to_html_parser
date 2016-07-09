require_relative 'test_helper'

class ParagraphTest < Minitest::Test

  def test_it_turns_md_into_html
    input = "My Life in Desserts"

    assert_equal "<p>My Life in Desserts</p>", Paragraph.new(input).to_html
  end

  def test_it_turns_multiline_text_into_a_paragraph
    input = '"You just have to try the cheesecake," he said. "Ever since it appeared in Food & Wine this place has been packed every night."'

    assert_equal "<p>#{input}</p>", Paragraph.new(input).to_html
  end

  def test_it_turns_single_line_breaks_into_a_paragraph
    input = "hello\nsummer"

    assert_equal "<p>hello summer</p>", Paragraph.new(input).to_html
  end

  def test_it_turns_two_line_breaks_into_paragraphs
    input = "hello\n\nsummer"

    assert_equal "<p>hello</p>\n<p>summer</p>", Paragraph.new(input).to_html
  end

  def test_it_does_not_turn_headers_into_html
    input = "# My Life in Desserts"

    assert_equal input, Paragraph.new(input).to_html
  end

  def test_it_does_not_turn_unordered_lists_into_paragraphs
    input = "* Sushi\n* Barbeque\n* Mexican\n"

    assert_equal input, Paragraph.new(input).to_html
  end

  def test_it_does_not_turn_ordered_lists_into_paragraphs
    input = "1. Sushi\n2. Barbeque\n3. Mexican\n"

    assert_equal input, Paragraph.new(input).to_html
  end

  def test_correctly_converts_md_paragraphs_to_html
    input = File.read "./my_input.md"
    output = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n<p>\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in **Food & Wine** this place has been packed every night.\"</p>"

    assert_equal output, Paragraph.new(input).to_html
  end
end
