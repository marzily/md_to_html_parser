class List
  attr_reader :md

  def initialize(md)
    @md = md
  end

  def to_html
    lines.map.with_index do |line, i|
      if is_ul?(line)
        ul(line, i)
      elsif is_ol?(line)
        ol(line, i)
      else
        line
      end
    end.join("\n")
  end

  def ol(line, i)
    if i == 0
      "<ol>\n  <li>#{ol_li_item(line)}</li>"
    elsif i == (lines.count - 1)
      "  <li>#{ol_li_item(line)}</li>\n</ol>"
    else
      "  <li>#{ol_li_item(line)}</li>"
    end
  end

  def ol_li_item(line)
    ol = (0..9).to_a.map(&:to_s) + ["."]

    i = 0
    while ol.include?(line[i]) && !line[i].nil?
      i += 1
    end

    line[i..-1].strip
  end

  def is_ol?(line)
    (0..9).to_a.map(&:to_s).include?(line[0])
  end

  def ul(line, i)
    if i == 0
      "<ul>\n  <li>#{ul_li_item(line)}</li>"
    elsif i == (lines.count - 1)
      "  <li>#{ul_li_item(line)}</li>\n</ul>"
    else
      "  <li>#{ul_li_item(line)}</li>"
    end
  end

  def ul_li_item(line)
    line[1..-1].strip
  end

  def is_ul?(line)
    line[0] == "*" && !line[1..-1].include?("*")
  end

  def lines
    md.split("\n")
  end
end
