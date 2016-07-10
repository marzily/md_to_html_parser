class List
  attr_reader :md

  def initialize(md)
    @md = md
  end

  def to_html
    lines.map do |line|
      if line[0] == "*" && line[1..-1]
      end

    end
  end

  def lines
    md.split("\n")
  end
end
