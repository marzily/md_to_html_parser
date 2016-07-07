require_relative 'test_helper'

class ItalicTest < Minitest::Test
  attr_reader :md

  def setup
    input = File.read "./my_input.md"
    @md = Italic.new(input)
  end

  def test_it_finds_emphasis_in_md_text
    assert_equal ["have"], md.find_em
  end

  def test_it_doesnt_find_bold_if_none
    skip
    md.md = "*hello* summer"

    assert_equal [], md.find_bold
  end

  def test_it_finds_multiple_text_to_bold
    skip
    md.md = "**hello** winter, **hello** summer"

    assert_equal ["hello", "hello"], md.find_bold
  end

  def test_it_writes_bold
    skip
    md.md = "**hello** winter"

    assert_equal "<strong>hello</strong>", md.write_bold("hello")
  end

  def test_it_converts_bold_to_html
    skip
    html = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n<strong>Food & Wine</strong> this place has been packed every night.\"\n"

    assert_equal html, md.to_html
  end
end
