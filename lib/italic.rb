class Italic
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def to_html
    text = find_em

    text.each do |section|
      write_em(section)
    end

    md
  end

  def write_em(section)
    i = md.index(section) - 1
    j = md.index(section) + section.length
    md[i..j] = "<em>" + section + "</em>"
  end

  def find_em
    text = []

    search_md = md
    while search_md.include?("*")
      search_md = save_italic(text, search_md)
    end

    text
  end

  def save_italic(text, search_md)
    i = search_md.index("*") + 1
    if search_md[i] != "*"
      italicized_text = italic_text(search_md, i)
      text << italicized_text.first
      search_md[italicized_text.last..-1]
    else
      search_md[(i + 1)..-1]
    end
  end

  def italic_text(search_md, i)
    italic = ""

    until search_md[i] == "*" && search_md[i..i + 1] != "**"
      italic << search_md[i]
      i += 1
    end

    [italic, i + 1]
  end
end
