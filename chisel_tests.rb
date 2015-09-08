gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
#require_relative 'chisel'         # ~> SyntaxError: /Users/edgarduran/code/projects/chisel/chisel_parser.rb:40: syntax error, unexpected end-of-input, expecting keyword_end
#require_relative 'chisel_parser'  # ~> SyntaxError: /Users/edgarduran/code/projects/chisel/chisel_parser.rb:40: syntax error, unexpected end-of-input, expecting keyword_end
require_relative 'header'
require_relative 'unordered_lists'

class ChiselTest < Minitest::Test

  def tes_input_file_ex
  end

#Header tests
  def test_does_it_count_1hash?
    header = Header.new("# Hash 1 example").header_type
    assert_equal "<h1>Hash 1 example</h1>\n\n", header
  end

  def test_does_it_count_2hash?
    header = Header.new("## Hash 2 example").header_type
    assert_equal "<h2>Hash 2 example</h2>\n\n", header
  end

  def test_does_it_count_xnum_hashes?
    header = Header.new("##### Hash xnum example").header_type
    assert_equal "<h5>Hash xnum example</h5>\n\n", header
  end

  def test_it_strips_1hash
    skip
    header = Header.new("# This is a 1 header").header_type
    assert_equal "This is a 1 header", @text
  end

# Unordered lists lists

  def test_it_returns_wrapped_list_item
    text = UnorderedLists.new("* One list item").unordered_list?
    assert_equal ["<li>One list item</li>\n"], text
  end

  def test_it_adds_ul_tag_to_either_end
    text = UnorderedLists.new("* Bullet point or something").start_end_tags_ul
    assert_equal "<ul>\n<li>Bullet point or something</li>\n</ul>\n\n", text
  end



end
