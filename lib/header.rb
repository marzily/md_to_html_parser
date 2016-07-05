class Header
  attr_accessor :md

  def initialize(md)
    @md = md
  end

  def lines
    md.split("\n")
  end



end
