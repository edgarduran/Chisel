gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
#require_relative 'chisel'         # ~> SyntaxError: /Users/edgarduran/code/projects/chisel/chisel_parser.rb:40: syntax error, unexpected end-of-input, expecting keyword_end
#require_relative 'chisel_parser'  # ~> SyntaxError: /Users/edgarduran/code/projects/chisel/chisel_parser.rb:40: syntax error, unexpected end-of-input, expecting keyword_end
require_relative 'header'   # => true

class ChiselTest < Minitest::Test  # => Minitest::Test

  def tes_input_file_ex
  end                    # => :tes_input_file_ex

#Header tests
  def test_does_it_count_1hash?
    text = ("# This is a 1 header")                          # => "# This is a 1 header"
    header = Header.new.header_type("# This is a 1 header")  # => "<h1>This is a 1 header</h1>\n\n"
    header = text.count("#")                                 # => 1
    p header                                                 # => 1
    assert_equal 1, header                                   # => true
  end                                                        # => :test_does_it_count_1hash?

  def test_does_it_count_2hash?
    text = "## This is a 2 header"  # => "## This is a 2 header"
    header = text.count("#")        # => 2
    p header                        # => 2
    assert_equal 2, header          # => true
  end                               # => :test_does_it_count_2hash?

  def test_does_it_count_xnum_hashes?
    text = "##### This is a xnum header"  # => "##### This is a xnum header"
    header = text.count("#")              # => 5
    p header                              # => 5
    assert_equal 5, header                # => true
  end                                     # => :test_does_it_count_xnum_hashes?

  def test_it_strips_1hash
    text = "# This is a 1 header"                 # => "# This is a 1 header"
    converted = text.delete!("#").strip!          # => "This is a 1 header"
    assert_equal "This is a 1 header", converted  # => true
  end                                             # => :test_it_strips_1hash

  def test_it_strips_2hashes
    text = "## This is a 2 header"                # => "## This is a 2 header"
    converted = text.delete!("#").strip!          # => "This is a 2 header"
    assert_equal "This is a 2 header", converted  # => true
  end                                             # => :test_it_strips_2hashes

  def test_it_strips_xnum_hashes
    text = "##### This is an xnum header"             # => "##### This is an xnum header"
    converted = text.delete!("#").strip!              # => "This is an xnum header"
    assert_equal "This is an xnum header", converted  # => true
  end                                                 # => :test_it_strips_xnum_hashes

  def test_it_creates_correct_1hash_tag
    text = "# This is a 1 header"             # => "# This is a 1 header"
    header = text.count("#")                  # => 1
    text.delete!("#").strip!                  # => "This is a 1 header"
    output = "<h#{header}></h#{header}>\n\n"  # => "<h1></h1>\n\n"
    assert_equal "<h1></h1>\n\n", output      # => true
  end                                         # => :test_it_creates_correct_1hash_tag

  def test_it_creates_correct_2hash_tag
    text = "## This is a 2 header"            # => "## This is a 2 header"
    header = text.count("#")                  # => 2
    text.delete!("#").strip!                  # => "This is a 2 header"
    output = "<h#{header}></h#{header}>\n\n"  # => "<h2></h2>\n\n"
    assert_equal "<h2></h2>\n\n", output      # => true
  end                                         # => :test_it_creates_correct_2hash_tag

  def test_it_creates_correct_xnum_hash_tag
    text = "##### This is a xnum header"      # => "##### This is a xnum header"
    header = text.count("#")                  # => 5
    text.delete!("#").strip!                  # => "This is a xnum header"
    output = "<h#{header}></h#{header}>\n\n"  # => "<h5></h5>\n\n"
    assert_equal "<h5></h5>\n\n", output      # => true
  end                                         # => :test_it_creates_correct_xnum_hash_tag

  def test_it_interpolates_and_outputs_header
    text = "## This is a 2 header"                      # => "## This is a 2 header"
    header = text.count("#")                            # => 2
    text.delete!("#").strip!                            # => "This is a 2 header"
    output ="<h#{header}>#{text}</h#{header}>"          # => "<h2>This is a 2 header</h2>"
    assert_equal "<h2>This is a 2 header</h2>", output  # => true
  end                                                   # => :test_it_interpolates_and_outputs_header

# Unordered lists lists

  def test_it_strips_astersisk
    text = "* Bullet point or something"            # => "* Bullet point or something"
    text.delete!("*").strip!                        # => "Bullet point or something"
    assert_equal "Bullet point or something", text  # => true
  end                                               # => :test_it_strips_astersisk

  def test_it_wraps_text_with_list_tag
    text = "Bullet point or something"                            # => "Bullet point or something"
    wrapped = "<li>#{text}</li>\n"                                # => "<li>Bullet point or something</li>\n"
    assert_equal "<li>Bullet point or something</li>\n", wrapped  # => true
  end                                                             # => :test_it_wraps_text_with_list_tag

  def test_it_adds_ul_tag_to_either_end
    text = "<li>Bullet point or something<li>\n"                               # => "<li>Bullet point or something<li>\n"
    tagged = "<ul>\n" + text + "</ul>\n\n"                                     # => "<ul>\n<li>Bullet point or something<li>\n</ul>\n\n"
    assert_equal "<ul>\n<li>Bullet point or something<li>\n</ul>\n\n", tagged  # => true
  end                                                                          # => :test_it_adds_ul_tag_to_either_end





end  # => :test_it_adds_ul_tag_to_either_end

# >> Run options: --seed 50434
# >>
# >> # Running:
# >>
# >> .5
# >> ...2
# >> .....1
# >> ....
# >>
# >> Finished in 0.001594s, 8156.0388 runs/s, 8156.0388 assertions/s.
# >>
# >> 13 runs, 13 assertions, 0 failures, 0 errors, 0 skips
