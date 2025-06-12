class HtmlBuilder
  def initialize(&block)
    @html = ""
    instance_eval(&block) if block_given?
  end

  def div(content = nil, &block)
    tag_content(__method__, content, &block)
  end

  def span(content = nil, &block)
    tag_content(__method__, content, &block)
  end

  def tag_content(tag, content, &block)
    @html << "<#{tag}>"
    if block_given?
      instance_eval(&block)
    else
      @html << content
    end
    @html << "</#{tag}>"
  end

  def result
    @html
  end
end


builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"
  end
  span "Nota de rodapé"
end

puts builder.result
