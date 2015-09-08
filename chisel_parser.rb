
require_relative 'header'
require_relative 'ordered_lists'
require_relative 'unordered_lists'
require_relative 'paragraphs'
require 'pry'



class ChiselParser
  attr_accessor :text, :input_file, :output

  def initialize(input_file)
    @output = output
    @input_file = input_file
    @text = File.open(input_file).read.split("\n\n")
  end


  def assign_type
    @text.map do |line|
      if line.strip.start_with?("#")
        Header.new(line).header_type
      elsif line.strip.start_with?("*")
        UnorderedLists.new(line).start_end_tags_ul
      elsif line.strip.start_with?("1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "9.", "0.")# Needs to be fixed to interpret number
        OrderedLists.new(line).start_end_tags_ol
      else
        Paragraphs.new(line).bold
      end
    end.join("\n")
    end

  def write
    output = File.open("output_file.html", "w")
    output.write(assign_type)
    p "Converted"
  end
end
