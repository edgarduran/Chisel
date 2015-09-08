# markdown input is : Just plain text like this

# HTML output is <p>Just plain text like this</p>
# pay attention to insert next line breaks in ruby

class Paragraphs
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def bold
    while text.include?("**")
      text.sub!("**", "<strong>")
      text.sub!("**", "</strong>")
    end
    italic
  end

  def italic
    while text.include?("*")
      text.sub!("*", "<em>")
      text.sub!("*", "</em>")
    end
    paragraph_put_together  
  end

  def paragraph_put_together
    "<p>\n#{text}\n</p>\n\n"
  end

  # text = "<p>\n#{text}\n</p>\n\n"

end
