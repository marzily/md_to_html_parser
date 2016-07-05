require_relative 'test_helper'

class HeaderTest < Minitest::Test
  attr_reader :md

  def setup
    input = File.read "./my_input.md"
    @md = Header.new input
  end

  def test_it_splits_md_into_newlines_array
    assert md.lines.is_a? Array
    assert "# My Life in Desserts", md.lines.first
  end

  def test_it_writes_headers
    assert_equal "<h1>My Life in Desserts</h1>", md.write_header(md.lines.first)
    assert_equal "<h2>Chapter 1: The Beginning</h2>", md.write_header(md.lines[2])
  end

  def test_it_doesnt_write_headers_if_none
    assert_equal "", md.write_header(md.lines[1])
    assert_equal md.lines[4], md.write_header(md.lines[4])
  end

  def test_it_correctly_counts_hashmarks
    assert 1, md.count_hashmarks(md.lines.first)
    assert 0, md.count_hashmarks(md.lines[1])
    assert 2, md.count_hashmarks(md.lines[2])
  end
end
