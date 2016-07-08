class Paragraph
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def to_html
    "<p>#{md}</p>"
  end

  def find_paragraph
  end
end
