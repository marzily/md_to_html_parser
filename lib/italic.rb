class Italic
  attr_accessor :md_lines

  def initialize(md_lines)
    @md_lines = md_lines
  end

  def to_html
    md_lines.map do |line|
      hashes = count_hashmarks(line)
      write_header(hashes, line)
    end
  end

  def find_em(line)




  end
end
