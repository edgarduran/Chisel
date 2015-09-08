require_relative 'chisel_parser'



input_file = ARGV[0]
ChiselParser.new(input_file).write
