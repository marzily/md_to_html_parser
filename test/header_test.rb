require_relative 'test_helper'

class HeaderTest < Minitest::Test
  attr_reader :header

  def setup
    input = File.read "./my_input.md"
    @header = Header.new(input.split("\n"))
  end

  def test_it_correctly_counts_hashmarks
    assert 1, header.count_hashmarks(header.lines.first)
    assert 0, header.count_hashmarks(header.lines[1])
    assert 2, header.count_hashmarks(header.lines[2])
  end

  def test_it_writes_headers
    assert_equal "<h1>My Life in Desserts</h1>", header.write_header(1, header.lines.first)
  end

  def test_it_writes_to_html
    assert_equal "<h1>My Life in Desserts</h1>", header.to_html(header.lines.first)
    assert_equal "<h2>Chapter 1: The Beginning</h2>", header.to_html(header.lines[2])
  end

  def test_it_doesnt_write_html_if_not_header
    assert_equal "", header.to_html(header.lines[1])
    assert_equal header.lines[4], header.to_html(header.lines[4])
  end
end
