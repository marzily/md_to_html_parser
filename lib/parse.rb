input = ARGV[0] if ARGV[0]
output = ARGV[1] if ARGV[1]

md = File.read input

def to_html(md)
  convert = Header.new(md)
  convert = Paragraph.new(convert)
end
