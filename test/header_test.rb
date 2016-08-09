require_relative 'test_helper'

class HeaderTest < Minitest::Test
  attr_reader :md_text

  def setup
    input = File.read "./my_input.md"
    @md_text = Header.new(input)
  end

  def test_it_correctly_counts_hashmarks
    assert_equal 1, md_text.count_hashmarks(md_text.lines.first)
    assert_equal 0, md_text.count_hashmarks(md_text.lines[1])
    assert_equal 2, md_text.count_hashmarks(md_text.lines[2])
  end

  def test_it_writes_headers
    assert_equal "<h1>My Life in Desserts</h1>", md_text.write_header(1, md_text.lines.first)
    assert_equal "<h2>Chapter 1: The Beginning</h2>", md_text.write_header(2, md_text.lines[2])
  end

  def test_it_doesnt_write_header_if_not_header
    assert_equal "", md_text.write_header(0, "")
    assert_equal md_text.lines[4], md_text.write_header(0, md_text.lines[4])
  end

  def test_it_writes_all_headers_to_html
    html = "<h1>My Life in Desserts</h1>  <h2>Chapter 1: The Beginning</h2>  \"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in **Food & Wine** this place has been packed every night.\""

    assert_equal html, md_text.to_html
  end
end
