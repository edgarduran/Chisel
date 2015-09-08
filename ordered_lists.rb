# markdown input 1., 2., 3. etc.. followed by text
# HTML output is <ol>
#                <li>Text</li>
#                <li>Text</li>
#                <li>Text</li>
#                </ol>

class OrderedLists

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def unordered_list?
    text.split("\n").map do |line|
      text2 = line.lstrip.split("")[3..-1].join("")
      "<li>#{text2}</li>\n"
    end
  end

  def start_end_tags_ol
    "<ol>\n" + unordered_list?.join("") + "</ol>\n\n"
  end

end
