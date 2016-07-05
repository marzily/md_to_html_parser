class Header
  attr_accessor :md

  def initialize(md)
    @md = md
    @md_with_headers = nil
  end

  def lines
    md.split("\n")
  end

  def to_html
    md.lines.each do |line|
      html_line = write_header(line)
    end
  end

  def write_header(line)
    start = size = count_hashmarks(line)
    new_line = line

    if size > 0
      start += 1 until line[start] != " "
      new_line = "<h#{size}>#{line[start..-1]}</h#{size}>"
    end

    new_line
  end

  def count_hashmarks(line)
    i = 0
    i += 1 until line[i] != "#"
    i
  end

end
