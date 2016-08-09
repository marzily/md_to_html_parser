class Paragraph
  attr_reader :md

  def initialize(md)
    @md = md
  end

  def to_html
    html = convert

    two_line_breaks(html)
  end

  private

    def convert
      lines.map do |line|
        if non_para.include?(line[0])
          line
        else
          write_paragraph(line)
        end
      end.join("\n\n")
    end

    def write_paragraph(line)
      if line.include?("\n")
        i = line.index("\n")
        line[i] = " "
      end
      "<p>#{line.rstrip}</p>"
    end

    def two_line_breaks(html)
      html.split("</p>\n\n<p>").map do |line|
        line
      end.join("</p>\n<p>")
    end

    def non_para
      (0..9).to_a.map(&:to_s) + %w(# *)
    end

    def lines
      md.split("\n\n")
    end
end
