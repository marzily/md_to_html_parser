class List
  attr_reader :md

  def initialize(md)
    @md = md
  end

  def to_html
    lines.map.with_index do |line, i|
      li = li_item(line)
      if is_list?(line) && i == 0
        "<ul>\n  <li>#{li}</li>"
      elsif is_list?(line) && i == (lines.count - 1)
        "  <li>#{li}</li>\n</ul>"
      elsif is_list?(line)
        "  <li>#{li}</li>"
      else
        line
      end
    end.join("\n")
  end

  def li_item(line)
    line[1..-1].strip
  end

  def is_list?(line)
    line[0] == "*" && !line[1..-1].include?("*")
  end

  def lines
    md.split("\n")
  end
end
