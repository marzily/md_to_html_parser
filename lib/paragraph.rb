class Paragraph
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def to_html
    if md[0] == "#"
      md
    elsif md.include?("\n\n")
      lines = split_content
      multi_lines(lines)
    else
      "<p>#{md}</p>"
    end
  end

  def split_content
    md.split("\n\n")
  end

  def multi_lines(lines)
    lines.map do |line|
      "<p>#{line}</p>"
    end.join("\n")
  end
end
