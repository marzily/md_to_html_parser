require 'pry'

class Bold
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def to_html
    bold_text = find_bold
  end

  def find_bold
    if md.include?("**")
      bold_text
    else
      ""
    end
  end

  def bold_text
    bold = ""
    i = md.index("**") + 2

    until md[i..i + 1] == "**"
      bold << md[i]
      i += 1
    end

    bold
  end
end
