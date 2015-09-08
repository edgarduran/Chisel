class UnorderedLists

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def unordered_list?
    text.split("\n").map do |line|
      text2 = line.split("")[0..-1].join("").delete("*").lstrip
      "<li>#{text2}</li>\n"
    end
  end

  def start_end_tags_ul
    # unordered_list?
    "<ul>\n" + unordered_list?.join("") + "</ul>\n\n"
  end

end
