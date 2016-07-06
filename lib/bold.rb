require 'pry'

class Bold
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def to_html
    text = bold

    text.each do |section|
      write_bold(section)
    end

    md
  end

  def write_bold(section)
    i = md.index(section) - 2
    j = md.index(section) + section.length + 1
    md[i..j] = "<strong>" + section + "</strong>"
  end

  def bold
    text = []

    search_md = md
    while search_md.include?("**")
      i = search_md.index("**") + 2
      bolded_text = bold_text(search_md, i)
      text << bolded_text.first
      search_md = search_md[bolded_text.last..-1]
    end

    text
  end

  def bold_text(search_md, i)
    bold = ""

    until search_md[i..i + 1] == "**"
      bold << search_md[i]
      i += 1
    end

    [bold, i + 1]
  end
end
