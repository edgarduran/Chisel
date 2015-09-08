class Header
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def header_type
    header = text.count("#")
    text.delete!("#").strip!
    "<h#{header}>#{text}</h#{header}>\n\n"


  end


end
