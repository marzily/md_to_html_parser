class Paragraph
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def to_html
    lines.map do |line|
      if non_para.include?(line[0])
        line
      else
        "<p>#{line}</p>"
      end
    end.join("\n")
  end

  def non_para
    (0..9).to_a.map(&:to_s) + %w(# *)
  end

  def lines
    md.split("\n\n")
  end
end
