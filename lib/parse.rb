require_relative 'header'
require_relative 'paragraph'
require_relative 'italic'
require_relative 'bold'

input = ARGV[0] if ARGV[0]
output = ARGV[1] if ARGV[1]

md = File.read input

def to_html(md)
  text = Header.new(md).to_html
  text = Paragraph.new(text).to_html
  text = Italic.new(text).to_html
  text = Bold.new(text).to_html
end

puts to_html(md)
