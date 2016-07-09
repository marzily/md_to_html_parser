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

  def test_it_doesnt_find_italic_if_none
    md.md = "**hello** summer"

    assert_equal [], md.find_em
  end

  def test_it_finds_multiple_text_to_italicize
    md.md = "*hello* winter, *hello* summer"

    assert_equal ["hello", "hello"], md.find_em
  end

  def test_it_writes_emphasis_tags
    md.md = "*hello* winter"

    assert_equal "<em>hello</em>", md.write_em("hello")
  end

  def test_it_converts_italics_to_html
    html = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n\"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in **Food & Wine** this place has been packed every night.\"\n"

    assert_equal html, md.to_html
  end
end
