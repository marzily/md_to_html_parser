class Header
  attr_accessor :lines

  def initialize(lines)
    @lines = lines
  end

  def to_html(line)
    hashes = count_hashmarks(line)

    if hashes > 0
      write_header(hashes, line)
    else
      line
    end
  end

  def write_header(hashes, line)
    start = hashes
    start += 1 until line[start] != " "
    "<h#{hashes}>#{line[start..-1]}</h#{hashes}>"
  end

  def count_hashmarks(line)
    i = 0
    i += 1 until line[i] != "#"
    i
  end
end
